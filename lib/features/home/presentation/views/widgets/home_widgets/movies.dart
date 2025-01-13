import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'slider_list_item.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../manager/movies_cubit/movies_cubit.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    context.read<MoviesCubit>().fetchPopularMoviesList();
    context.read<MoviesCubit>().fetchTopRatedMoviesList();
    context.read<MoviesCubit>().fetchNowPlayingMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MoviesCubit, MoviesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is PopularMoviesLoading ||
                currentState is PopularMoviesSuccess ||
                currentState is PopularMoviesFailure;
          },
          builder: (context, state) {
            if (state is PopularMoviesSuccess) {
              final popularList = state.popularList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 25, bottom: 15),
                    child: Text(
                      "Popular Now",
                      style: Styles.textStyle20,
                    ),
                  ),
                  SizedBox(
                    height: 320.h,
                    child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SliderListItem(
                        // onTap: () {},
                        data: popularList[index],
                        datatype: 'Movie',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PopularMoviesFailure) {
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
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is TopRateMoviesLoading ||
                currentState is TopRateMoviesSuccess ||
                currentState is TopRateMoviesFailure;
          },
          builder: (context, state) {
            if (state is TopRateMoviesSuccess) {
              final topRateList = state.topRateList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 25, bottom: 15),
                    child: Text(
                      "Top Rated",
                      style: Styles.textStyle20,
                    ),
                  ),
                  SizedBox(
                    height: 320.h,
                    child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SliderListItem(
                        //onTap: () {},
                        data: topRateList[index],
                        datatype: 'Movie',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is TopRateMoviesFailure) {
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
        ),
        BlocBuilder<MoviesCubit, MoviesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is NowPlayingMoviesLoading ||
                currentState is NowPlayingMoviesSuccess ||
                currentState is NowPlayingMoviesFailure;
          },
          builder: (context, state) {
            if (state is NowPlayingMoviesSuccess) {
              final nowPlayingList = state.nowPlayingList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 25, bottom: 15),
                    child: Text(
                      "Now Playing",
                      style: Styles.textStyle20,
                    ),
                  ),
                  SizedBox(
                    height: 320.h,
                    child: ListView.builder(
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => SliderListItem(
                        data: nowPlayingList[index],
                        datatype: 'Movie',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is NowPlayingMoviesFailure) {
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
        ),
      ],
    );
  }
}
