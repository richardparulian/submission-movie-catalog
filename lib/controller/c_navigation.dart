import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt currentIndexTopMenu = 0.obs;
  RxInt currentIndexBottomMenu = 0.obs;
  
  void changeIndexTopMenu(index) {
    currentIndexTopMenu.value = index;
  }

  void changeIndexBottomMenu(index) {
    currentIndexBottomMenu.value = index;
  }
}