import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../manager/movie_details_cubit/movie_details_cubit.dart';
import '../home_widgets/slider_list_item.dart';

class RecommendedMovieList extends StatefulWidget {
  const RecommendedMovieList({super.key, required this.movieId});
  final int movieId;

  @override
  State<RecommendedMovieList> createState() => _RecommendedMovieListState();
}

class _RecommendedMovieListState extends State<RecommendedMovieList> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getRecommendedMoviesList(widget.movieId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previousState, currentState) {
        print(
            "Previous State: $previousState, Current State: $currentState");
        return currentState is RecommendedMovieLoading ||
            currentState is RecommendedMovieSuccess ||
            currentState is RecommendedMovieFailure;
      },
      builder: (context, state) {
        if (state is RecommendedMovieSuccess) {
          final recommendedList = state.recommendedMovieList;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 16.0, top: 25, bottom: 15),
                child: Text(
                  "Recommended Movies",
                  style: Styles.textStyle20,
                ),
              ),
              SizedBox(
                height: 320.h,
                child: ListView.builder(
                  itemCount: recommendedList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => SliderListItem(
                    data: recommendedList[index],
                    datatype: 'Movie',
                  ),
                ),
              ),
            ],
          );
        } else if (state is RecommendedMovieFailure) {
          print(state.errMessage);
          return Center(
              child: Text('Failed to load movies ${state.errMessage}'));
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
}