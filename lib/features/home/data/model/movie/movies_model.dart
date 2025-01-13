class MovieModel {
  final bool adult;
  final String? backdropPath; // Make String nullable
  final List<int> genreIds;
  final int id;
  final String? originalLanguage; // Make String nullable
  final String? originalTitle; // Make String nullable
  final String? overview; // Make String nullable
  final double popularity;
  final String? posterPath; // Make String nullable
  final String? releaseDate; // Make String nullable
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] as String?, // Handle nullability here
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'] as String?, // Handle nullability here
      originalTitle: json['original_title'] as String?, // Handle nullability here
      overview: json['overview'] as String?, // Handle nullability here
      popularity: (json['popularity'] ?? 0.0).toDouble(), // Ensure popularity is a double
      posterPath: json['poster_path'] as String?, // Handle nullability here
      releaseDate: json['release_date'] as String?, // Handle nullability here
      title: json['title'] as String,
      video: json['video'],
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(), // Ensure voteAverage is a double
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

class MovieDbModel {
  final int id;
  final String title;
  final String posterPath;

  MovieDbModel({required this.id, required this.title, required this.posterPath});

  // Convert a MovieDbModel into a Map for storing in the database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
    };
  }

  // Convert a Map into a MovieDbModel
  factory MovieDbModel.fromMap(Map<String, dynamic> map) {
    return MovieDbModel(
      id: map['id'],
      title: map['title'],
      posterPath: map['posterPath'],
    );
  }
}

