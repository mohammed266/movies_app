import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/tv/tv_series_model.dart';
import '../../../data/repos/tv_series_repo/tv_series_repo.dart';

part 'tv_series_state.dart';

class TvSeriesCubit extends Cubit<TvSeriesState> {
  TvSeriesCubit(this.tvSeriesRepo)
      : super(TvSeriesInitial());

  final TvSeriesRepo tvSeriesRepo;

  Future<void> fetchPopularTvSeriesList() async {
    emit(PopularTvSeriesLoading());
    var result = await tvSeriesRepo.getPopularTvSeries();
    result.fold(
      (failure) {
        emit(
            PopularTvSeriesFailure(failure.message)); // Emitting failure if any
      },
      (popularTvSeriesList) {
        if (popularTvSeriesList.isEmpty) {
          emit(PopularTvSeriesFailure("No data available"));
        } else {
          emit(PopularTvSeriesSuccess(
              popularTvSeriesList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> fetchTopRatedTvSeriesList() async {
    emit(TopRateTvSeriesLoading());
    var result = await tvSeriesRepo.getTopRatedSeries();
    result.fold(
      (failure) {
        emit(
            TopRateTvSeriesFailure(failure.message)); // Emitting failure if any
      },
      (topRateTvSeriesList) {
        if (topRateTvSeriesList.isEmpty) {
          emit(TopRateTvSeriesFailure("No data available"));
        } else {
          emit(TopRateTvSeriesSuccess(
              topRateTvSeriesList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> fetchOnAirTvSeriesList() async {
    emit(OnAirTvSeriesLoading());
    var result = await tvSeriesRepo.getOnAirSeries();
    result.fold(
          (failure) {
        emit(
            OnAirTvSeriesFailure(failure.message)); // Emitting failure if any
      },
          (onAirTvSeriesList) {
        if (onAirTvSeriesList.isEmpty) {
          emit(TopRateTvSeriesFailure("No data available"));
        } else {
          emit(OnAirTvSeriesSuccess(
              onAirTvSeriesList)); // Emitting success with the valid list
        }
      },
    );
  }

}
