import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/trending_moves_repo/trending_movies_repo.dart';
import '../../../data/model/movie/trending_movies_model.dart';

part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this.trendingMoviesRepo) : super(TrendingMoviesInitial());
  final TrendingMoviesRepo trendingMoviesRepo;

  Future<void> fetchTrendingMoviesList(String dOrW) async {
    emit(TrendingMoviesLoading());
    var result = await trendingMoviesRepo.getTrendingMovies(dOrW);
    result.fold(
      (failure) {
        emit(TrendingMoviesFailure(failure.message)); // Emitting failure if any
      },
      (trendingMoviesList) {
        if (trendingMoviesList.isEmpty) {
          emit(TrendingMoviesFailure("No data available"));
        } else {
          emit(TrendingMoviesSuccess(
              trendingMoviesList)); // Emitting success with the valid list
        }
      },
    );
  }
}
