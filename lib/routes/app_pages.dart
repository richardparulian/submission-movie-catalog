import 'package:get/get.dart';
import '../pages/home.dart';
import '../pages/splash_screen.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.splashScreen, page: () => SplashScreenPage()),
    GetPage(name: RouteName.home, page: () => HomePage()),
  ];
}