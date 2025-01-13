import 'package:dartz/dartz.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../model/movie/trending_movies_model.dart';

abstract class TrendingMoviesRepo {
  Future<Either<Failure, List<Movie>>> getTrendingMovies(String dOrW);
}
