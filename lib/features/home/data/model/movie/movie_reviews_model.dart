class MovieReviews {
  final List<Review> reviews;

  MovieReviews({required this.reviews});

  factory MovieReviews.fromJson(List<dynamic> json) {
    return MovieReviews(
      reviews: json.map((item) => Review.fromJson(item)).toList(),
    );
  }
}

class Review {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;
  final num? rating;

  Review({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      authorDetails: AuthorDetails.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
      rating: json['rating'] ?? 0,
    );
  }
}

class AuthorDetails {
  final String? name;
  final String username;
  final String? avatarPath;
  final num? rating;

  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json['name'] ?? '',
      username: json['username'],
      avatarPath: json['avatar_path'] ?? '',
      rating: json['rating'] ?? 0,
    );
  }
}
