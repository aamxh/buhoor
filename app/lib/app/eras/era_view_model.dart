import 'package:buhoor/app/poem/poem_model.dart';
import 'package:get/get.dart';

class EraViewModel extends GetxController {

  var eraName = ''.obs;
  var eraSlug = ''.obs;
  var poems = <Poem>[].obs;
  RxInt page = 1.obs;
  RxInt totalPages = 1.obs;

}