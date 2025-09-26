import 'package:buhoor/app/poets/poet_model.dart';
import 'package:buhoor/core/constants.dart';
import 'package:buhoor/core/helpers.dart';
import 'package:dio/dio.dart';

class MyApi {

  MyApi._();

  static final dio = Dio();

  static Future<List<Poet>> getPoetsByPage(int page) async {
    try {
      final res = await dio.get("${MyConstants.baseUrl}poets?page=$page");
      if (MyHelpers.isResOk(res.statusCode!)) {
        final data = res.data!['poets'] as List;
        final poets = data.map((json) => Poet.fromJson(json as Map<String, dynamic>)).toList();
        return poets;
      }
      return [];
    } catch(ex) {
      print(ex);
      return [];
    }
  }

}