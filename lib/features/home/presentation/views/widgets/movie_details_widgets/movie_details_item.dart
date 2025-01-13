import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/styles.dart';

import '../../../manager/movie_details_cubit/movie_details_cubit.dart';

class MovieDetailsItem extends StatefulWidget {
  const MovieDetailsItem({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailsItem> createState() => _MovieDetailsItemState();
}

class _MovieDetailsItemState extends State<MovieDetailsItem> {
  @override
  void initState() {
    context.read<MovieDetailsCubit>().getMovieDetails(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
      buildWhen: (previousState, currentState) {
        // Only rebuild if state changes related to trailers
        return currentState is MovieDetailsLoading ||
            currentState is MovieDetailsSuccess ||
            currentState is MovieDetailsFailure;
      },
      builder: (context, state) {
        if (state is MovieDetailsSuccess) {
          final genresList = state.movieDetails.genres;
          final movieDetails = state.movieDetails;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.w, top: 10.h),
                height: 65.h,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: genresList?.length,
                  itemBuilder: (context, index) {
                    // genres box
                    return Container(
                      margin: EdgeInsets.only(right: 16.w),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 25, 25, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        genresList?[index].name ?? 'Unknown Genre',
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 16.w, top: 16.h),
                height: 50.h,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(25, 25, 25, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${movieDetails.runtime ?? 0} min',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 10.h, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Movie Story :', style: Styles.textStyle20),
                    10.verticalSpace,
                    Text(
                      movieDetails.overview.toString(),
                      style: Styles.textStyle16.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    8.verticalSpace,
                    Text('Release Date : ${movieDetails.releaseDate}',style: Styles.textStyle16),
                    8.verticalSpace,
                    Text('Budget : ${movieDetails.budget}',style: Styles.textStyle16),
                    8.verticalSpace,
                    Text('Revenue : ${movieDetails.revenue}',style: Styles.textStyle16),
                  ],
                ),
              ),
            ],
          );
        } else if (state is MovieDetailsFailure) {
          print(state.errMessage);
          return Center(
            child: Text('Failed to load movie: ${state.errMessage}'),
          );
        }
        // Default loading indicator
        return const Center(
          widthFactor: 10,
          heightFactor: 10,
          child: CircularProgressIndicator(color: Colors.amber),
        );
      },
    );
  }
}
