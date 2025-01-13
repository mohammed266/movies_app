import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/networking/api_endpoints.dart';
import 'package:movies_app/core/networking/api_service.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../model/search/search_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<SearchModel>>> getSearchData(String searchText) async {
    try {
      final response = await apiService.get(
          endpoint: ApiEndpoints.getSearchData(searchText));
      if (response["results"] is List) {
        List<SearchModel> searchList = [];
        for (var item in response["results"]) {
          searchList.add(SearchModel.fromJson(item));
        }
        return Right(searchList);
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
