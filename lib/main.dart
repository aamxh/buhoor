import 'package:buhoor/app/auth/common/auth_wrapper_view.dart';
import 'package:buhoor/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:buhoor/core/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(MyApp());
}

Future<void> _initializeApp() async {
  Get.put(ThemeCtrl());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: AuthWrapperView(),
    );
  }

}