import 'package:buhoor/app/poem/poem_model.dart';
import 'package:get/get.dart';

class MeterViewModel extends GetxController {

  var meterName = ''.obs;
  var meterSlug = ''.obs;
  var poems = <Poem>[].obs;
  RxInt page = 1.obs;
  RxInt totalPages = 1.obs;

}