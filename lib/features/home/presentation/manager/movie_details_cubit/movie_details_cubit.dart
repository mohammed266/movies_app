import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie/movie_details_model.dart';
import '../../../data/model/movie/movie_reviews_model.dart';
import '../../../data/model/movie/movie_trailers_model.dart';
import '../../../data/model/movie/recommend_movie_model.dart';
import '../../../data/model/movie/similar_movie_model.dart';
import '../../../data/repos/movie_details_repo/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());
  final MovieDetailsRepo movieDetailsRepo;
  MovieDetailModel? movieDetails;

  Future<void> getMovieTrailersList(int id) async {
    emit(MovieTrailersLoading());
    var result = await movieDetailsRepo.getMovieTrailers(id);
    result.fold(
      (failure) {
        emit(MovieTrailersFailure(failure.message)); // Emitting failure if any
      },
      (trailersList) {
        if (trailersList.isEmpty) {
          emit(MovieTrailersFailure("No data available"));
        } else {
          emit(MovieTrailersSuccess(
              trailersList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> getMovieDetails(int id) async {
    emit(MovieDetailsLoading());
    var result = await movieDetailsRepo.getMovieDetails(id);
    result.fold(
      (failure) {
        // Emitting failure if any
        emit(MovieDetailsFailure(failure.message));
        throw Exception(failure.message);
      },
      (movieDetails) {
        this.movieDetails = movieDetails;
        // Emitting success with the valid list
        emit(MovieDetailsSuccess(movieDetails));
      },
    );
  }

  Future<void> getMovieReviews(int id) async {
    emit(UserReviewLoading());
    var result = await movieDetailsRepo.getMovieReviews(id);
    result.fold(
          (failure) {
        emit(UserReviewFailure(failure.message)); // Emitting failure if any
      },
          (movieReview) {
        emit(UserReviewSuccess(
            movieReview)); // Emitting success with the valid list
      },
    );
  }

  Future<void> getSimilarMoviesList(int id) async {
    emit(SimilarMovieLoading());
    var result = await movieDetailsRepo.getSimilarMovies(id);
    result.fold(
          (failure) {
        emit(SimilarMovieFailure(failure.message)); // Emitting failure if any
      },
          (similarMovie) {
        emit(SimilarMovieSuccess(
            similarMovie)); // Emitting success with the valid list
      },
    );
  }

  Future<void> getRecommendedMoviesList(int id) async {
    emit(RecommendedMovieLoading());
    var result = await movieDetailsRepo.getRecommendMovies(id);
    result.fold(
          (failure) {
        emit(RecommendedMovieFailure(failure.message)); // Emitting failure if any
      },
          (similarMovie) {
        emit(RecommendedMovieSuccess(
            similarMovie)); // Emitting success with the valid list
      },
    );
  }
}
