import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_failure.dart';

import '../../model/movie/movie_details_model.dart';
import '../../model/movie/movie_reviews_model.dart';
import '../../model/movie/movie_trailers_model.dart';
import '../../model/movie/recommend_movie_model.dart';
import '../../model/movie/similar_movie_model.dart';

import 'movie_details_repo.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final ApiService apiService;

  MovieDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetails(int id) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getMovieDetails(id));
      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(response);
      return Right(movieDetailModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieReviews>>> getMovieReviews(int id) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getMovieReviews(id));

      if (response["results"] is List) {
        List<MovieReviews> movieReviewsList = [];
        for (var item in response["results"]) {
          if (item is Map<String, dynamic>) {
            movieReviewsList.add(MovieReviews.fromJson(
                [item])); // Pass the single item as a list to fromJson
          }
        }
        return Right(movieReviewsList);
      } else {
        return Left(
            ServerFailure('Invalid response format. Expected a list of data.'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<MovieTrailers>>> getMovieTrailers(int id) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getMovieTrailers(id));

      if (response["results"] is List) {
        List<MovieTrailers> movieTrailersList = [];
        for (var item in response["results"]) {
          movieTrailersList.add(MovieTrailers.fromJson(item));
        }
        return Right(movieTrailersList);
      } else {
        return Left(
            ServerFailure('Invalid response format. Expected a list of data.'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<RecommendMovie>>> getRecommendMovies(
      int id) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getRecommendMovie(id));

      if (response["results"] is List) {
        List<RecommendMovie> recommendMovieList = [];
        for (var item in response["results"]) {
          recommendMovieList.add(RecommendMovie.fromMap(item));
        }
        return Right(recommendMovieList);
      } else {
        return Left(
            ServerFailure('Invalid response format. Expected a list of data.'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<SimilarMovies>>> getSimilarMovies(int id) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getSimilarMovie(id));

      if (response["results"] is List) {
        List<SimilarMovies> similarMovieList = [];
        for (var item in response["results"]) {
          similarMovieList.add(SimilarMovies.fromMap(item));
        }
        return Right(similarMovieList);
      } else {
        return Left(
            ServerFailure('Invalid response format. Expected a list of data.'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
