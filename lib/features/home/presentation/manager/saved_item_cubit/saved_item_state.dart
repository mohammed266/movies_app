part of 'saved_item_cubit.dart';

@immutable
sealed class SavedItemState {}

final class SavedItemInitial extends SavedItemState {}
class SavedItemLoading extends SavedItemState {}

class SavedItemSuccess extends SavedItemState {
  final List<MovieDbModel> favoriteMovies;

  SavedItemSuccess(this.favoriteMovies);
}

class SavedItemFailure extends SavedItemState {
  final String errMessage;

  SavedItemFailure(this.errMessage);
}
