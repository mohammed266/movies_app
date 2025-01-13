import 'package:dartz/dartz.dart';

import '../../../../../core/networking/api_failure.dart';
import '../../model/movie/movie_details_model.dart';
import '../../model/movie/movie_reviews_model.dart';
import '../../model/movie/movie_trailers_model.dart';
import '../../model/movie/recommend_movie_model.dart';
import '../../model/movie/similar_movie_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailModel>> getMovieDetails(int id);
  Future<Either<Failure, List<MovieReviews>>> getMovieReviews(int id);
  Future<Either<Failure, List<SimilarMovies>>> getSimilarMovies(int id);
  Future<Either<Failure, List<RecommendMovie>>> getRecommendMovies(int id);
  Future<Either<Failure, List<MovieTrailers>>> getMovieTrailers(int id);
}
