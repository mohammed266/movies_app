class RecommendMovie {
  String? backdropPath;
  int id;
  String title;
  String originalTitle;
  String overview;
  String? posterPath;
  String mediaType;
  bool adult;
  String originalLanguage;
  List<int> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  // Constructor
  RecommendMovie({
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Factory constructor to create a RecommendMovie object from a map (like the one in the JSON)
  factory RecommendMovie.fromMap(Map<String, dynamic> map) {
    return RecommendMovie(
      backdropPath: map['backdrop_path'],
      id: map['id'],
      title: map['title'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      posterPath: map['poster_path'],
      mediaType: map['media_type'],
      adult: map['adult'],
      originalLanguage: map['original_language'],
      genreIds: List<int>.from(map['genre_ids']),
      popularity: map['popularity'].toDouble(),
      releaseDate: map['release_date'],
      video: map['video'],
      voteAverage: map['vote_average'].toDouble(),
      voteCount: map['vote_count'],
    );
  }

  // Method to convert RecommendMovie object to map (useful for encoding to JSON)
  Map<String, dynamic> toMap() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  // String representation of the RecommendMovie object
  @override
  String toString() {
    return 'RecommendMovie(title: $title, releaseDate: $releaseDate, voteAverage: $voteAverage)';
  }
}

