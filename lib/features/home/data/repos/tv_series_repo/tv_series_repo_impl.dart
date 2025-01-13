import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/networking/api_failure.dart';

import '../../model/tv/tv_series_model.dart';

import '../../../../../core/networking/api_endpoints.dart';
import '../../../../../core/networking/api_service.dart';
import 'tv_series_repo.dart';

class TvSeriesRepoImpl implements TvSeriesRepo {
  final ApiService apiService;

  TvSeriesRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<TvSeriesModel>>> getPopularTvSeries() async {
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getPopularTvSeries());
      if (response["results"] is List) {
        List<TvSeriesModel> popularTvSeriesList = [];
        for (var item in response["results"]) {
          popularTvSeriesList.add(TvSeriesModel.fromJson(item));
        }
        return Right(popularTvSeriesList);
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
  Future<Either<Failure, List<TvSeriesModel>>> getTopRatedSeries() async{
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getTopRatedTvSeries());
      if (response["results"] is List) {
        List<TvSeriesModel> topRatedSeriesList = [];
        for (var item in response["results"]) {
          topRatedSeriesList.add(TvSeriesModel.fromJson(item));
        }
        return Right(topRatedSeriesList);
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
  Future<Either<Failure, List<TvSeriesModel>>> getOnAirSeries() async{
    try {
      final response =
          await apiService.get(endpoint: ApiEndpoints.getOnAirTvSeries());
      if (response["results"] is List) {
        List<TvSeriesModel> onAirSeriesList = [];
        for (var item in response["results"]) {
          onAirSeriesList.add(TvSeriesModel.fromJson(item));
        }
        return Right(onAirSeriesList);
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
