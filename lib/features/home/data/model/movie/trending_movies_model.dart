class TrendingMovies {
  final List<Movie> movies;

  TrendingMovies({required this.movies});

  factory TrendingMovies.fromJson(List<dynamic> json) {
    List<Movie> movies = json.map((item) => Movie.fromJson(item)).toList();
    return TrendingMovies(movies: movies);
  }
}

class Movie {
  final String backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final bool? adult; // Marked as nullable to handle null
  final String originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final String releaseDate;
  final bool? video; // Marked as nullable to handle null
  final double? voteAverage;
  final int voteCount;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    this.adult, // Optional, as it can be null
    required this.originalLanguage,
    required this.genreIds,
    this.popularity, // Nullable
    required this.releaseDate,
    this.video, // Optional, as it can be null
    this.voteAverage, // Nullable
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'] ?? '',
      id: json['id'],
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      adult: json['adult'] as bool?, // Cast to bool? to handle null values
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: json['popularity'] != null ? (json['popularity'] as num).toDouble() : 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] as bool?, // Cast to bool? to handle null values
      voteAverage: json['vote_average'] != null ? (json['vote_average'] as num).toDouble() : 0.0,
      voteCount: json['vote_count'],
    );
  }
}
