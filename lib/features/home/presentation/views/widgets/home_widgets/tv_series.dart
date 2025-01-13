import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';

import '../../../manager/tv_series_cubit/tv_series_cubit.dart';
import 'slider_list_item.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({super.key});

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  @override
  void initState() {
    context.read<TvSeriesCubit>().fetchPopularTvSeriesList();
    context.read<TvSeriesCubit>().fetchTopRatedTvSeriesList();
    context.read<TvSeriesCubit>().fetchOnAirTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<TvSeriesCubit, TvSeriesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is PopularTvSeriesLoading ||
                currentState is PopularTvSeriesSuccess ||
                currentState is PopularTvSeriesFailure;
          },
          builder: (context, state) {
            if (state is PopularTvSeriesSuccess) {
              final popularList = state.popularTvSeriesList;
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
                        //onTap: () {},
                        data: popularList[index],
                        datatype: 'Tv',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PopularTvSeriesFailure) {
              print(state.errMessage);
              return Center(
                  child: Text('Failed to load movies ${state.errMessage}'));
            }
            // else if(state is PopularTvSeriesLoading){
            //   return const Center(
            //     heightFactor: 5,
            //     child: CircularProgressIndicator(
            //       color: Colors.amber,
            //     ),
            //   );
            // }
            return const Center(
              heightFactor: 5,
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
            //return const Center(child: Text('unhandled state'));
          },
        ),
        BlocBuilder<TvSeriesCubit, TvSeriesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is TopRateTvSeriesLoading ||
                currentState is TopRateTvSeriesSuccess ||
                currentState is TopRateTvSeriesFailure;
          },
          builder: (context, state) {
            if (state is TopRateTvSeriesSuccess) {
              final topRateList = state.topRateTvSeriesList;
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
                       // onTap: () {},
                        data: topRateList[index],
                        datatype: 'Tv',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is TopRateTvSeriesFailure) {
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
        BlocBuilder<TvSeriesCubit, TvSeriesState>(
          buildWhen: (previousState, currentState) {
            print(
                "Previous State: $previousState, Current State: $currentState");
            return currentState is OnAirTvSeriesLoading ||
                currentState is OnAirTvSeriesSuccess ||
                currentState is OnAirTvSeriesFailure;
          },
          builder: (context, state) {
            if (state is OnAirTvSeriesSuccess) {
              final onAirList = state.onAirTvSeriesList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 25, bottom: 15),
                    child: Text(
                      "On Air Now",
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
                        data: onAirList[index],
                        datatype: 'Tv',
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is OnAirTvSeriesFailure) {
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
