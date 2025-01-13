import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../../../../core/networking/api_service.dart';

import '../../model/movie/movies_model.dart';

import '../../../../../core/networking/api_endpoints.dart';
import 'movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
  final ApiService apiService;

  MoviesRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getNowPlayingMovies());
      if (response["results"] is List) {
        List<MovieModel> nowPlayingMoviesList = [];
        for (var item in response["results"]) {
          nowPlayingMoviesList.add(MovieModel.fromJson(item));
        }
        return Right(nowPlayingMoviesList);
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
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getPopularMovies());
      if (response["results"] is List) {
        List<MovieModel> popularMoviesList = [];
        for (var item in response["results"]) {
          popularMoviesList.add(MovieModel.fromJson(item));
        }
        return Right(popularMoviesList);
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
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getTopRatedMovies());
      if (response["results"] is List) {
        List<MovieModel> topRatedMoviesList = [];
        for (var item in response["results"]) {
          topRatedMoviesList.add(MovieModel.fromJson(item));
        }
        return Right(topRatedMoviesList);
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
  Future<Either<Failure, List<MovieModel>>> getUpComingMovies() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getUpcomingMovies());
      if (response["results"] is List) {
        List<MovieModel> upComingMoviesList = [];
        for (var item in response["results"]) {
          upComingMoviesList.add(MovieModel.fromJson(item));
        }
        return Right(upComingMoviesList);
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
