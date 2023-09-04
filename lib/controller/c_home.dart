import 'dart:convert';
import 'package:get/get.dart';
import '../utils/api_endpoint.dart';
import '../utils/headers_manager.dart';

class HomeController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    fetchAllTrending();
  }
  
  Future<void> fetchAllTrending() async {
    try {
      const language = "en-US";
      const timeWindow = "day";
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.allTrending}$timeWindow?language=$language";
      final response = await HeaderManager.get(url);
    

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        print(responseBody['results']);
      } 
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}