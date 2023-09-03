import 'package:get/get.dart';

class MenusController extends GetxController {
  RxList<Map<String, dynamic>> topMenu = [
    {
      'id': 1,
      'label': "All",
    },
    {
      'id': 2,
      'label': "Movies",
    },
    {
      'id': 3,
      'label': "TV shows",
    },
  ].obs;
}