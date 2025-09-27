import 'package:buhoor/app/common/api.dart';
import 'package:buhoor/app/poem/poem_model.dart';
import 'package:buhoor/app/poets/poet_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  Rx<Poem> randomPoem = Poem().obs;
  Rx<Poet> randomPoet = Poet().obs;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    final newRandomPoem = await MyApi.getRandomPoem();
    final newRandomPoet = await MyApi.getRandomPoet();
    if (newRandomPoem != null) {
      randomPoem.value = newRandomPoem;
    }
    if (newRandomPoet != null) {
      randomPoet.value = newRandomPoet;
    }
  }

}