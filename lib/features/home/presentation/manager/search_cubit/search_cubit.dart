import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/search/search_model.dart';
import '../../../data/repos/search_repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> getSearchData(String searchText) async{
    emit(SearchLoading());

    var result = await searchRepo.getSearchData(searchText);
    result.fold(
          (failure) {
        emit(SearchFailure(failure.message)); // Emitting failure if any
      },
          (popularList) {
        if (popularList.isEmpty) {
          emit(SearchFailure("No data available"));
        } else {
          emit(SearchSuccess(
              popularList)); // Emitting success with the valid list
        }
      },
    );

  }
  // Method to clear the search results
  void clearSearchResults() {
    emit(SearchInitial());
  // Reset to initial state to show the default "Start Searching..." message
  }
}
