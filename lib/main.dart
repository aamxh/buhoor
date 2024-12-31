import 'package:buhoor/core/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:buhoor/app/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(MyApp());
}

Future<void> _initializeApp() async {

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.myLightTheme,
      darkTheme: MyTheme.myDarkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeV(),
    );
  }

}