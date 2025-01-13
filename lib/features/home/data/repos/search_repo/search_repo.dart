import 'package:dartz/dartz.dart';
import '../../../../../core/networking/api_failure.dart';
import '../../model/search/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<SearchModel>>> getSearchData(String searchText);
}