import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/manager/trending_movies_cubit/trending_movies_cubit.dart';
import '../../features/home/presentation/views/widgets/home_widgets/trending_container_item.dart';

class CarouselSliderList extends StatefulWidget {
  const CarouselSliderList({super.key});

  @override
  State<CarouselSliderList> createState() => _CarouselSliderListState();
}

class _CarouselSliderListState extends State<CarouselSliderList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.trendingMoviesList.length,
            itemBuilder: (_, index, pageIndex) {
              return state.trendingMoviesList.isNotEmpty
                  ? TrendingContainerItem(
                      index: index,
                      data: state.trendingMoviesList[index],
                    )
                  : const SizedBox.shrink();
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.5,
              autoPlay: true,
              //aspectRatio: 2,
              viewportFraction: 1,
              enlargeCenterPage: false,
              autoPlayInterval: const Duration(seconds: 2),
            ),
          );
        } else if (state is TrendingMoviesFailure) {
          print(state.errMessage);
          return Center(
              child: Text('Failed to load movies ${state.errMessage}'));
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.amber,
          ),
        );
      },
    );
  }
}
