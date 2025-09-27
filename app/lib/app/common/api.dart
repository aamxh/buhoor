import 'package:buhoor/app/poem/poem_model.dart';
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

  static Future<Poem?> getRandomPoem() async {
    try {
      final id = MyHelpers.getRandomPoemId();
      final res = await dio.get("${MyConstants.baseUrl}poems?id=$id");
      if (MyHelpers.isResOk(res.statusCode!)) {
        final data = res.data!['poems'][0];
        return Poem.fromJson(data as Map<String, dynamic>);
      }
      return null;
    } catch(ex) {
      print(ex);
      return null;
    }
  }

  static Future<Poet?> getRandomPoet() async {
    try {
      final id = MyHelpers.getRandomPoetId();
      final res = await dio.get("${MyConstants.baseUrl}poets?id=$id");
      if (MyHelpers.isResOk(res.statusCode!)) {
        final data = res.data!['poets'][0];
        print(data);
        return Poet.fromJson(data as Map<String, dynamic>);
      }
      return null;
    } catch(ex) {
      print(ex);
      return null;
    }
  }

  static Future<List<Poem>> getFilteredPoems({
    String? poet,
    String? genre,
    String? era,
    String? meter,
    int page = 1
  }) async {
    String query = "?";
    query += "page=$page";
    if (poet != null) {
      if (!query.endsWith("?")) query += "&";
      query += "poet=$poet";
    }
    if (genre != null) {
      if (!query.endsWith("?")) query += "&";
      query += "genre=$genre";
    }
    if (era != null) {
      if (!query.endsWith("?")) query += "&";
      query += "era=$era";
    }
    if (meter != null) {
      if (!query.endsWith("?")) query += "&";
      query += "meter=$meter";
    }
    try {
      final res = await dio.get('${MyConstants.baseUrl}poems$query');
      if (MyHelpers.isResOk(res.statusCode!)) {
        final data = res.data!['poems'] as List;
        final poems = data.map((json) => Poem.fromJson(json as Map<String, dynamic>)).toList();
        return poems;
      }
      return [];
    } catch(ex) {
      print(ex);
      return [];
    }
  }

}