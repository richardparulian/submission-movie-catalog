class MovieResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'],
      results: (json['results'] as List).map((movieJson) => Movie.fromJson(movieJson)).toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Movie {
  final bool? adult;
  final String? backdropPath;
  final int id;
  final String? name;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? title;
  final String? releaseDate;
  final bool? video;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final List<String>? originCountry;
  final String? firstAirDate;
  final double popularity;

  Movie({
    this.adult,
    this.backdropPath,
    required this.id,
    this.name,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.title,
    this.releaseDate,
    this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    this.originCountry,
    this.firstAirDate,
    required this.popularity,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] != "" ? json['adult'] : "",
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      title: json['title'],
      releaseDate: json['release_date'],
      video: json['video'] != "" ? json['video'] : "",
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      genreIds: List<int>.from(json['genre_ids']),
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country']) : null,
      firstAirDate: json['first_air_date'],
      popularity: json['popularity'].toDouble(),
    );
  }
}
