import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/db_helper.dart';
import "../../../data/model/movie/movies_model.dart";

part 'saved_item_state.dart';

class SavedItemCubit extends Cubit<SavedItemState> {
  final DatabaseHelper _databaseHelper;

  SavedItemCubit(this._databaseHelper) : super(SavedItemInitial());

  // Fetch all favorite movies from the database
  Future<void> loadFavorites() async {
    emit(SavedItemLoading());
    try {
      final favoriteMovies = await _databaseHelper.getFavorites();
      emit(SavedItemSuccess(favoriteMovies));
    } catch (e) {
      emit(SavedItemFailure(e.toString()));
    }
  }

  // Add a movie to the favorites list
  Future<void> addFavorite(MovieDbModel movie) async {
    try {
      await _databaseHelper.insertFavorite(movie);
      loadFavorites(); // Reload the list after adding
    } catch (e) {
      emit(SavedItemFailure(e.toString()));
    }
  }

  // Remove a movie from the favorites list
  Future<void> removeFavorite(int movieId) async {
    try {
      await _databaseHelper.deleteFavorite(movieId);
      loadFavorites(); // Reload the list after removing
    } catch (e) {
      emit(SavedItemFailure(e.toString()));
    }
  }
}
