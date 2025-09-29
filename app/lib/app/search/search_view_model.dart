import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/poem/poem_model.dart';
import 'package:buhoor/app/poets/poet_model.dart';
import 'package:get/get.dart';

class SearchViewModel extends GetxController {

  var poemsSearched = <Poem>[].obs;
  var poetsSearched = <Poet>[].obs;
  var word = ''.obs;
  var searchEnded = false.obs;

  Future<void> search() async {
    final results = await MyApi.searchKeyWord(word.value);
    poemsSearched.value = (results['poems'] as List<dynamic>)
        .map((e) => Poem.fromJson(e as Map<String, dynamic>))
        .toList();
    poetsSearched.value = (results['poets'] as List<dynamic>)
        .map((e) => Poet.fromJson(e as Map<String, dynamic>))
        .toList();
    searchEnded.value = true;
  }

}