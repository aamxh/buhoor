import 'package:buhoor/core/helpers.dart';
import 'package:dio/dio.dart';

class AuthApi {

  AuthApi._();

  final dio = Dio();

  static Future<bool> isUserAuthenticated() async {
    try {
      return true;
    } catch(ex) {
      MyHelpers.showError(ex.toString());
      return false;
    }
  }

}