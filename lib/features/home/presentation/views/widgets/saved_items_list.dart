import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/model/movie/movies_model.dart';

import '../../../../../core/resources/styles.dart';
import '../../manager/saved_item_cubit/saved_item_cubit.dart';

class SavedItemsList extends StatelessWidget {
  const SavedItemsList({super.key, required this.favoriteMovies});
  final List<MovieDbModel> favoriteMovies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteMovies.length,
      itemBuilder: (context, index) {
        final movie = favoriteMovies[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 250.h,
            child: Row(
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: 130.w,
                    height: 250.h,
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'movie',
                      style: Styles.textStyle16,
                    ),
                    SizedBox(
                      width: 130.w,
                      child: Text(
                        movie.title,
                        style: Styles.textStyle14,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Watch Trailer',
                          style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  iconSize: 30,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context.read<SavedItemCubit>().removeFavorite(movie.id);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
