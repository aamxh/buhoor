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

  static bool isResOk(int code) {
    if (code < 200 || code >= 300) return false;
    return true;
  }

  static String getEraById(int id) {
    final eras = MyConstants.eras;
    for (int i = 0; i < eras.length; i++) {
      if (eras[i]['id'] == id) return eras[i]['name'].toString();
    }
    return '';
  }

}