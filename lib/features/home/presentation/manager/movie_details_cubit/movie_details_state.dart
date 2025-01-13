part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieTrailersLoading extends MovieDetailsState {}

final class MovieTrailersSuccess extends MovieDetailsState {
  final List<MovieTrailers> movieTrailersList;

  MovieTrailersSuccess(this.movieTrailersList);
}

final class MovieTrailersFailure extends MovieDetailsState {
  final String errMessage;

  MovieTrailersFailure(this.errMessage);
}

/// details states ////////////////

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailModel movieDetails;

  MovieDetailsSuccess(this.movieDetails);
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage;

  MovieDetailsFailure(this.errMessage);
}

/// user review ///////////////

final class UserReviewLoading extends MovieDetailsState {}

final class UserReviewSuccess extends MovieDetailsState {
  final List<MovieReviews> reviewList;

  UserReviewSuccess(this.reviewList);
}

final class UserReviewFailure extends MovieDetailsState {
  final String errMessage;

  UserReviewFailure(this.errMessage);
}



/// similar movie /////////////////

final class SimilarMovieLoading extends MovieDetailsState {}

final class SimilarMovieSuccess extends MovieDetailsState {
  final List<SimilarMovies> similarMovieList;

  SimilarMovieSuccess(this.similarMovieList);
}

final class SimilarMovieFailure extends MovieDetailsState {
  final String errMessage;

  SimilarMovieFailure(this.errMessage);
}

/// recommended movies ////////////////

final class RecommendedMovieLoading extends MovieDetailsState {}

final class RecommendedMovieSuccess extends MovieDetailsState {
  final List<RecommendMovie> recommendedMovieList;

  RecommendedMovieSuccess(this.recommendedMovieList);
}

final class RecommendedMovieFailure extends MovieDetailsState {
  final String errMessage;

  RecommendedMovieFailure(this.errMessage);
}
