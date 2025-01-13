import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../manager/movies_cubit/movies_cubit.dart';
import 'slider_list_item.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  void initState() {
    context.read<MoviesCubit>().fetchUpComingMoviesList();
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
            return currentState is UpComingMoviesLoading ||
                currentState is UpComingMoviesSuccess ||
                currentState is UpComingMoviesFailure;
          },
          builder: (context, state) {
            if (state is UpComingMoviesSuccess) {
              final upComingList = state.upComingList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 25, bottom: 15),
                    child: Text(
                      "Up Coming",
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
                        data: upComingList[index],
                        datatype: 'Movie',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 40, bottom: 40),
                    child: Text(
                      "Many More Coming Soon... ",
                      style: Styles.textStyle20,
                    ),
                  ),
                ],
              );
            } else if (state is UpComingMoviesFailure) {
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
