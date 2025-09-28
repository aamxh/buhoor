import 'package:buhoor/app/poets/poet_model.dart';
import 'package:get/get.dart';
import '../poem/poem_model.dart';

class PoetViewModel extends GetxController {

  var poet = Poet().obs;
  var poems = <Poem>[].obs;
  RxInt page = 1.obs;
  RxInt totalPages = 1.obs;

}