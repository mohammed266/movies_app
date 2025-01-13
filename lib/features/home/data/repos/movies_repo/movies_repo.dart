import 'package:dartz/dartz.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../model/movie/movies_model.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getUpComingMovies();
}
