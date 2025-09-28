import 'package:buhoor/app/poem/poem_model.dart';
import 'package:get/get.dart';

class GenreViewModel extends GetxController {

  var genreName = ''.obs;
  var genreSlug = ''.obs;
  var poems = <Poem>[].obs;
  RxInt page = 1.obs;
  RxInt totalPages = 1.obs;

}