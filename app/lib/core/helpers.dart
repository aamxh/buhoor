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

}