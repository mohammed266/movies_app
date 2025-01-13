part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

/// Popular ///////////

final class PopularMoviesLoading extends MoviesState {}

final class PopularMoviesSuccess extends MoviesState {
  final List<MovieModel> popularList;

  PopularMoviesSuccess(this.popularList);
}

final class PopularMoviesFailure extends MoviesState {
  final String errMessage;

  PopularMoviesFailure(this.errMessage);
}

/// top Rate //////////

final class TopRateMoviesLoading extends MoviesState {}

final class TopRateMoviesSuccess extends MoviesState {
  final List<MovieModel> topRateList;

  TopRateMoviesSuccess(this.topRateList);
}

final class TopRateMoviesFailure extends MoviesState {
  final String errMessage;

  TopRateMoviesFailure(this.errMessage);
}

/// Now Playing ////////

final class NowPlayingMoviesLoading extends MoviesState {}

final class NowPlayingMoviesSuccess extends MoviesState {
  final List<MovieModel> nowPlayingList;

  NowPlayingMoviesSuccess(this.nowPlayingList);
}

final class NowPlayingMoviesFailure extends MoviesState {
  final String errMessage;

  NowPlayingMoviesFailure(this.errMessage);
}

/// Up Coming ////////

final class UpComingMoviesLoading extends MoviesState {}

final class UpComingMoviesSuccess extends MoviesState {
  final List<MovieModel> upComingList;

  UpComingMoviesSuccess(this.upComingList);
}

final class UpComingMoviesFailure extends MoviesState {
  final String errMessage;

  UpComingMoviesFailure(this.errMessage);
}
