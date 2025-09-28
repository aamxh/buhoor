import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {

  RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  Future<void> switchTheme() async {
    isDark.value = !isDark.value;
    saveTheme();
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> saveTheme() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark.value);
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final res = prefs.getBool('isDark') ?? false;
    isDark.value = res;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

}