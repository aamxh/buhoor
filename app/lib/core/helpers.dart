import 'package:buhoor/core/constants.dart';
import 'package:get/get.dart';
import 'dart:math';

class MyHelpers {

  MyHelpers._();

  static void showError(String text) {
    Get.showSnackbar(GetSnackBar(
      message: text,
      title: 'An error occured!',
      backgroundColor: MyConstants.errorColor,
      isDismissible: false,
      duration: Duration(seconds: 4),
    ));
  }

  static bool isResOk(int code) {
    if (code < 200 || code >= 300) return false;
    return true;
  }

  static int getRandomPoetId() {
    final random = Random();
    return random.nextInt(931) + 2609;
  }

  static int getRandomPoemId() {
    final random = Random();
    return random.nextInt(85342) + 1;
  }

  static String formatPoem(String poem) {
    List<String> lines = poem.split('*').map((l) => l.trim()).toList();
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < lines.length; i++) {
      buffer.writeln(lines[i]);
      // Add an extra line break after every pair of lines (except the last one)
      if (i % 2 == 1 && i != lines.length - 1) {
        buffer.writeln();
      }
    }
    return buffer.toString().trimRight();
  }

}