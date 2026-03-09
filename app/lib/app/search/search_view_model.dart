import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/common/loading_route.dart';
import 'package:buhoor/app/poem/poem_model.dart';
import 'package:buhoor/app/poets/poet_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {

  var poemsSearched = <Poem>[].obs;
  var poetsSearched = <Poet>[].obs;
  var word = ''.obs;
  var searchEnded = false.obs;

  Future<void> search() async {
    final results = await runWithLoadingRoute(
      (cancelToken) => MyApi.searchKeyWord(
        word.value,
        cancelToken: cancelToken,
      ),
    );
    if (results == null) {
      if (Get.key.currentState?.canPop() ?? false) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (Get.key.currentState?.canPop() ?? false) {
            Get.back();
          }
        });
      }
      return;
    }
    poemsSearched.value = (results['poems'] as List<dynamic>)
        .map((e) => Poem.fromJson(e as Map<String, dynamic>))
        .toList();
    poetsSearched.value = (results['poets'] as List<dynamic>)
        .map((e) => Poet.fromJson(e as Map<String, dynamic>))
        .toList();
    searchEnded.value = true;
  }

}