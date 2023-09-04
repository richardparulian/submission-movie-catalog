import 'package:get/get.dart';
import 'package:movie_catalog/utils/headers_manager.dart';

class PublicController extends GetxController {
  final HeaderManager _headersManager = Get.put(HeaderManager());
  final RxString splashImage = "assets/images/logo-white.png".obs;
  final RxString userImage = "assets/images/user.png".obs;
  final RxString accessTokenAuth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTFiZTkwYWRiMDlkODRlY2M3NDdkMGFiMTBhZjE4ZCIsInN1YiI6IjY0ZjM1OTcyMWYzMzE5MDBlMzU2Yjk5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6ypNFhy6KBeo8vlnw_npfKR6uosQ-H4peUBUm-s7OSE".obs;

  @override
  void onInit() {
    super.onInit();
    saveTokenToStorage();
  }

  void saveTokenToStorage() async {
    await _headersManager.saveToken(accessTokenAuth.value);
  }
}