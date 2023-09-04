class ApiEndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseUrlImage = 'https://image.tmdb.org/t/p/original';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String allTrending = '/trending/all/';
  
}
