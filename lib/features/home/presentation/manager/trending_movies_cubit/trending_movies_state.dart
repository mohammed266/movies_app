part of 'trending_movies_cubit.dart';

@immutable
sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoading extends TrendingMoviesState {}

final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<Movie> trendingMoviesList;

  TrendingMoviesSuccess(this.trendingMoviesList);
}

final class TrendingMoviesFailure extends TrendingMoviesState {
  final String errMessage;

  TrendingMoviesFailure(this.errMessage);
}
