import 'package:buhoor/core/constants.dart';
import 'package:get/get.dart';

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

}