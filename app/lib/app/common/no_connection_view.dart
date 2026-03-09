import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoConnectionView extends StatelessWidget {
  const NoConnectionView({
    super.key,
    required this.message,
    this.canPop = true,
  });

  final String message;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 56,
                    color: theme.colorScheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Get.back(result: true),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width * 0.5, size.height * 0.064),
                      elevation: 0,
                    ),
                    child: Text(
                      'أعد المحاولة',
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}