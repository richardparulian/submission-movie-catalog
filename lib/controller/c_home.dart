import 'dart:convert';
import 'package:get/get.dart';
import '../model/m_movies.dart';
import '../utils/api_endpoint.dart';
import '../utils/headers_manager.dart';

class HomeController extends GetxController {
  final RxList<Movie> allTrending = <Movie>[].obs;
  final RxList<Movie> moviesPopular = <Movie>[].obs;
  final RxList<Movie> moviesTopRated = <Movie>[].obs;
  final RxList<Movie> tvShowsPopular = <Movie>[].obs;
  final RxList<Movie> tvShowsTopRated = <Movie>[].obs;

  RxInt currentIndexSliders = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllTrending();
    fetchMoviePopular();
    fetchMovieTopRated();
    fetchTvShowsPopular();
    fetchTvShowsTopRated();
  }

  Future<void> fetchAllTrending() async {
    try {
      const language = "en-US";
      const timeWindow = "week";
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.allTrending}$timeWindow?language=$language";
      final response = await HeaderManager.get(url);
    

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final MovieResponse movieResponse = MovieResponse.fromJson(responseBody);
    
        allTrending.assignAll(movieResponse.results);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> fetchMoviePopular() async {
    try {
      const language = "en-US";
      const page = 1;
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.moviesPopular}?language=$language&page=$page";
      final response = await HeaderManager.get(url);
    
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final MovieResponse movieResponse = MovieResponse.fromJson(responseBody);
    
        moviesPopular.assignAll(movieResponse.results);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> fetchMovieTopRated() async {
    try {
      const language = "en-US";
      const page = 1;
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.moviesTopRated}?language=$language&page=$page";
      final response = await HeaderManager.get(url);
    
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final MovieResponse movieResponse = MovieResponse.fromJson(responseBody);
    
        moviesTopRated.assignAll(movieResponse.results);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> fetchTvShowsPopular() async {
    try {
      const language = "en-US";
      const page = 1;
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.tvShowsPopular}?language=$language&page=$page";
      final response = await HeaderManager.get(url);
    
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final MovieResponse movieResponse = MovieResponse.fromJson(responseBody);
    
        tvShowsPopular.assignAll(movieResponse.results);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> fetchTvShowsTopRated() async {
    try {
      const language = "en-US";
      const page = 1;
      
      final url = "${ApiEndPoints.baseUrl}${ApiEndPoints.authEndPoints.tvShowsTopRated}?language=$language&page=$page";
      final response = await HeaderManager.get(url);
    
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final MovieResponse movieResponse = MovieResponse.fromJson(responseBody);
    
        tvShowsTopRated.assignAll(movieResponse.results);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}