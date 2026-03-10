import 'dart:async';
import 'package:buhoor/app/common/no_connection_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class _RequestTimeoutException implements Exception {
  const _RequestTimeoutException();
}

const Duration _requestTimeout = Duration(minutes: 1);

const String _noInternetMessage =
    'لا يوجد اتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.';
const String _requestTimeoutMessage =
    'لا يوجد اتصال. استغرق الطلب أكثر من دقيقة. يرجى المحاولة مرة أخرى.';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.onCancel,
    this.canPop = true,
  });

  static const routeName = '/loading-route';

  final VoidCallback onCancel;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        appBar: canPop
            ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    onCancel();
                    unawaited(_closeLoadingRoute());
                  },
                ),
              )
            : null,
        body: Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

bool _canNavigateNow() {
  final phase = WidgetsBinding.instance.schedulerPhase;
  return phase == SchedulerPhase.idle || phase == SchedulerPhase.postFrameCallbacks;
}

Future<void> _runSafeNavigation(VoidCallback action) async {
  if (_canNavigateNow()) {
    action();
    return;
  }

  final completer = Completer<void>();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    action();
    if (!completer.isCompleted) {
      completer.complete();
    }
  });
  await completer.future;
}

Future<bool> _showLoadingRoute(
  CancelToken cancelToken, {
  required bool canPop,
}) async {
  var shown = false;
  await _runSafeNavigation(() {
    if (Get.currentRoute == LoadingView.routeName) {
      return;
    }
    shown = true;
    unawaited(
      Get.to(
        () => LoadingView(
          onCancel: () {
            if (!cancelToken.isCancelled) {
              cancelToken.cancel('cancelled-by-user');
            }
          },
          canPop: canPop,
        ),
        routeName: LoadingView.routeName,
        preventDuplicates: false,
      ),
    );
  });
  return shown;
}

Future<void> _closeLoadingRoute() async {
  await _runSafeNavigation(() {
    if (Get.currentRoute == LoadingView.routeName) {
      Get.back();
    }
  });
}

Future<bool> _showNoConnectionView(
  String message, {
  required bool canPop,
}) async {
  Future<bool?>? routeResult;
  await _runSafeNavigation(() {
    routeResult = Get.to<bool>(
      () => NoConnectionView(
        message: message,
        canPop: canPop,
      ),
      preventDuplicates: false,
    );
  });
  final result = await (routeResult ?? Future<bool?>.value(false));
  return result == true;
}

Future<bool> _hasInternetConnection() async {
  return InternetConnection().hasInternetAccess;
}

Future<T?> runWithLoadingRoute<T>(
  Future<T> Function(CancelToken cancelToken) request, {
  bool noConnectionCanPop = true,
  bool loadingCanPop = true,
}) async {
  while (true) {
    final cancelToken = CancelToken();
    final loadingShown = await _showLoadingRoute(
      cancelToken,
      canPop: loadingCanPop,
    );

    if (cancelToken.isCancelled) {
      if (loadingShown) {
        await _closeLoadingRoute();
      }
      return null;
    }

    final connected = await _hasInternetConnection();
    if (!connected) {
      if (loadingShown) {
        await _closeLoadingRoute();
      }
      final retry = await _showNoConnectionView(
        _noInternetMessage,
        canPop: noConnectionCanPop,
      );
      if (!retry) return null;
      continue;
    }

    var timedOut = false;

    try {
      final result = await request(cancelToken).timeout(
        _requestTimeout,
        onTimeout: () {
          if (!cancelToken.isCancelled) {
            cancelToken.cancel('request-timeout');
          }
          throw const _RequestTimeoutException();
        },
      );
      return cancelToken.isCancelled ? null : result;
    } on _RequestTimeoutException {
      timedOut = true;
    } on DioException catch (ex) {
      if (CancelToken.isCancel(ex)) {
        return null;
      }
      rethrow;
    } finally {
      if (loadingShown) {
        await _closeLoadingRoute();
      }
    }

    if (timedOut) {
      final retry = await _showNoConnectionView(
        _requestTimeoutMessage,
        canPop: noConnectionCanPop,
      );
      if (!retry) return null;
      continue;
    }
  }
}