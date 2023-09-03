import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndexTopMenu = 0.obs;
  
  void changeIndexTopMenu(index) {
    currentIndexTopMenu.value = index;
  }
}