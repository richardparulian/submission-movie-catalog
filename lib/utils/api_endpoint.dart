class ApiEndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String baseUrlImage = 'https://image.tmdb.org/t/p/original';
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints {
  final String allTrending = '/trending/all/';
  final String moviesPopular = '/movie/popular';
  final String moviesTopRated = '/movie/top_rated';
  final String tvShowsPopular = '/tv/popular';
  final String tvShowsTopRated = '/tv/top_rated';
}
