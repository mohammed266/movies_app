import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../model/movie/trending_movies_model.dart';
import 'trending_movies_repo.dart';

import '../../../../../core/networking/api_service.dart';

class TrendingMoviesRepoImpl implements TrendingMoviesRepo {
  final ApiService apiService;

  TrendingMoviesRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies(String dOrW) async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getTrendingMovies(dOrW: dOrW));
      if (response["results"] is List) {
        List<Movie> trendingMoviesList = [];
        for (var item in response["results"]) {
          trendingMoviesList.add(Movie.fromJson(item));

        }
        return Right(trendingMoviesList);
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
