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
    'No internet connection. Please check your connection and try again.';
const String _requestTimeoutMessage =
    'No connection. The request took more than 1 minute. Please retry.';

class LoadingRouteView extends StatelessWidget {
  const LoadingRouteView({
    super.key,
    required this.onCancel,
  });

  static const routeName = '/loading-route';

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            onCancel();
            unawaited(_closeLoadingRoute());
          },
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          color: theme.colorScheme.secondary,
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

Future<bool> _showLoadingRoute(CancelToken cancelToken) async {
  var shown = false;
  await _runSafeNavigation(() {
    if (Get.currentRoute == LoadingRouteView.routeName) {
      return;
    }
    shown = true;
    unawaited(
      Get.to(
        () => LoadingRouteView(
          onCancel: () {
            if (!cancelToken.isCancelled) {
              cancelToken.cancel('cancelled-by-user');
            }
          },
        ),
        routeName: LoadingRouteView.routeName,
        preventDuplicates: false,
      ),
    );
  });
  return shown;
}

Future<void> _closeLoadingRoute() async {
  await _runSafeNavigation(() {
    if (Get.currentRoute == LoadingRouteView.routeName) {
      Get.back();
    }
  });
}

Future<bool> _showNoConnectionView(
  String message, {
  required bool canPop,
}) async {
  bool retry = false;
  await _runSafeNavigation(() {
    unawaited(
      Get.to(
        () => NoConnectionView(
          message: message,
          canPop: canPop,
        ),
        preventDuplicates: false,
      )!.then((value) {
        retry = value == true;
      }),
    );
  });
  await Future<void>.delayed(const Duration(milliseconds: 16));
  return retry;
}

Future<bool> _hasInternetConnection() async {
  return InternetConnection().hasInternetAccess;
}

Future<T?> runWithLoadingRoute<T>(
  Future<T> Function(CancelToken cancelToken) request, {
  bool noConnectionCanPop = true,
}) async {
  while (true) {
    final cancelToken = CancelToken();
    final loadingShown = await _showLoadingRoute(cancelToken);

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