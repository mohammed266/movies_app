import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/styles.dart';

import '../../../manager/movie_details_cubit/movie_details_cubit.dart';
import 'movie_review_list.dart';

class UsersReviews extends StatefulWidget {
  const UsersReviews({super.key});

  @override
  State<UsersReviews> createState() => _UsersReviewsState();
}

class _UsersReviewsState extends State<UsersReviews> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previousState, currentState) {
        return currentState is UserReviewLoading ||
            currentState is UserReviewSuccess ||
            currentState is UserReviewFailure;
      },
      builder: (context, state) {
        if (state is UserReviewSuccess) {
          final reviewList = state.reviewList;

          // Return early if the review list is empty
          if (reviewList.isEmpty) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                if (showAll) MovieReviewList(reviewList: reviewList),
              ],
            ),
          );
        } else if (state is UserReviewFailure) {
          return Center(
            child: Text('Failed to load reviews: ${state.errMessage}'),
          );
        }

        return const Center(
          heightFactor: 5,
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'User Reviews',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: _toggleShowAll,
          child: _buildShowAllButton(),
        ),
      ],
    );
  }

  Widget _buildShowAllButton() {
    final buttonText = showAll ? 'Show Less' : 'All Reviews';
    final icon = showAll
        ? const Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 40)
        : const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 40);

    return Row(
      children: [
        Text(buttonText, style: Styles.textStyle16),
        const SizedBox(width: 5),
        icon,
      ],
    );
  }

  void _toggleShowAll() {
    setState(() {
      showAll = !showAll;
    });
  }
}
