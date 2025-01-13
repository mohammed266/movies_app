class SearchModel {
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
  String? firstAirDate;
  String? originCountry;

  // Constructor to initialize the fields
  SearchModel({
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
    this.firstAirDate,
    this.originCountry,
  });

  // Factory method to create a SearchModel instance from JSON
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'] ?? json['name'] ?? '',
      originalTitle: json['original_title'] ?? json['original_name'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      mediaType: json['media_type'] ?? '',
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: json['popularity']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      firstAirDate: json['first_air_date'],
      originCountry: json['origin_country'] != null ? List<String>.from(json['origin_country']).join(', ') : null,
    );
  }

  // Method to convert SearchModel instance back to JSON
  Map<String, dynamic> toJson() {
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
      'first_air_date': firstAirDate,
      'origin_country': originCountry?.split(', '),
    };
  }
}

