part of 'tv_series_cubit.dart';

@immutable
sealed class TvSeriesState {}

final class TvSeriesInitial extends TvSeriesState {}

final class PopularTvSeriesLoading extends TvSeriesState {}

final class PopularTvSeriesSuccess extends TvSeriesState {
  final List<TvSeriesModel> popularTvSeriesList;

  PopularTvSeriesSuccess(this.popularTvSeriesList);
}

final class PopularTvSeriesFailure extends TvSeriesState {
  final String errMessage;

  PopularTvSeriesFailure(this.errMessage);
}

///TopRate///TvSeries//////states/////////////////////

final class TopRateTvSeriesLoading extends TvSeriesState {}

final class TopRateTvSeriesSuccess extends TvSeriesState {
  final List<TvSeriesModel> topRateTvSeriesList;

  TopRateTvSeriesSuccess(this.topRateTvSeriesList);
}

final class TopRateTvSeriesFailure extends TvSeriesState {
  final String errMessage;

  TopRateTvSeriesFailure(this.errMessage);
}

///On Air//TvSeries//////states/////////////////////

final class OnAirTvSeriesLoading extends TvSeriesState {}

final class OnAirTvSeriesSuccess extends TvSeriesState {
  final List<TvSeriesModel> onAirTvSeriesList;

  OnAirTvSeriesSuccess(this.onAirTvSeriesList);
}

final class OnAirTvSeriesFailure extends TvSeriesState {
  final String errMessage;

  OnAirTvSeriesFailure(this.errMessage);
}
