import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles.dart';
import '../manager/saved_item_cubit/saved_item_cubit.dart';
import 'widgets/saved_items_list.dart';

class SavedItemsView extends StatefulWidget {
  const SavedItemsView({super.key});

  @override
  SavedItemsViewState createState() => SavedItemsViewState();
}

class SavedItemsViewState extends State<SavedItemsView> {
  @override
  void initState() {
    super.initState();
    // Load favorites when the screen is initialized
    context.read<SavedItemCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Padding(
          padding: buildEdgeInsets(),
          child: Column(
            children: [
              buildCenter(),
              20.verticalSpace,
              Expanded(
                child: BlocBuilder<SavedItemCubit, SavedItemState>(
                  builder: (context, state) {
                    if (state is SavedItemLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is SavedItemFailure) {
                      return Center(child: Text('Error: ${state.errMessage}'));
                    }

                    if (state is SavedItemSuccess) {
                      final favoriteMovies = state.favoriteMovies;
                      if (favoriteMovies.isEmpty) {
                        return const Center(
                            child: Text('No favorite movies yet.'));
                      }
                      return SavedItemsList(favoriteMovies: favoriteMovies);
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets buildEdgeInsets() {
    return EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      top: 30.h,
    );
  }

  Center buildCenter() {
    return Center(
      child: Text(
        'Saved',
        style: Styles.textStyle20,
      ),
    );
  }
}
