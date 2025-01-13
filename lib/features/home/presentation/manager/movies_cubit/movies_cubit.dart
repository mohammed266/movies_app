import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/movie/movies_model.dart';
import '../../../data/repos/movies_repo/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());
  final MoviesRepo moviesRepo;

  Future<void> fetchPopularMoviesList() async {
    emit(PopularMoviesLoading());
    var result = await moviesRepo.getPopularMovies();
    result.fold(
      (failure) {
        emit(PopularMoviesFailure(failure.message)); // Emitting failure if any
      },
      (popularList) {
        if (popularList.isEmpty) {
          emit(PopularMoviesFailure("No data available"));
        } else {
          emit(PopularMoviesSuccess(
              popularList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> fetchTopRatedMoviesList() async {
    emit(TopRateMoviesLoading());
    var result = await moviesRepo.getTopRatedMovies();
    result.fold(
      (failure) {
        emit(TopRateMoviesFailure(failure.message)); // Emitting failure if any
      },
      (topRateList) {
        if (topRateList.isEmpty) {
          emit(TopRateMoviesFailure("No data available"));
        } else {
          emit(TopRateMoviesSuccess(
              topRateList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> fetchNowPlayingMoviesList() async {
    emit(NowPlayingMoviesLoading());
    var result = await moviesRepo.getNowPlayingMovies();
    result.fold(
      (failure) {
        emit(NowPlayingMoviesFailure(
            failure.message)); // Emitting failure if any
      },
      (nowPlayingList) {
        if (nowPlayingList.isEmpty) {
          emit(NowPlayingMoviesFailure("No data available"));
        } else {
          emit(NowPlayingMoviesSuccess(
              nowPlayingList)); // Emitting success with the valid list
        }
      },
    );
  }

  Future<void> fetchUpComingMoviesList() async {
    emit(UpComingMoviesLoading());
    var result = await moviesRepo.getUpComingMovies();
    result.fold(
          (failure) {
        emit(UpComingMoviesFailure(
            failure.message)); // Emitting failure if any
      },
          (upComingList) {
        if (upComingList.isEmpty) {
          emit(UpComingMoviesFailure("No data available"));
        } else {
          emit(UpComingMoviesSuccess(
              upComingList)); // Emitting success with the valid list
        }
      },
    );
  }
}
