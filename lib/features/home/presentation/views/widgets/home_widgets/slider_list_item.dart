import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';

class SliderListItem extends StatelessWidget {
  const SliderListItem({
    super.key,
    required this.data,
    required this.datatype,
  });
  final dynamic data;
  final String datatype;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (datatype == 'Tv') {
          Navigator.pushNamed(
            context,
            Routes.kTvDetailsView,
            arguments: data.id,
          );
          print('${data.id}');
        } else {
          Navigator.pushNamed(
            context,
            Routes.kMovieDetailsView,
            arguments: data.id,
          );
          print('${data.id}');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 13),
        width: 150.w,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 150.w,
                height: 320.h,
                imageUrl: 'https://image.tmdb.org/t/p/w500${data.posterPath}',
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 6),
                  child: Text(
                    datatype == 'Tv' ? data.firstAirDate : data.releaseDate,
                    style: Styles.textStyle12.copyWith(
                      decoration: TextDecoration.none,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.02,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 2, bottom: 2, left: 5, right: 5),
                      child: Row(
                        //row for rating
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            data.voteAverage.toStringAsFixed(2),
                            style: Styles.textStyle12.copyWith(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.02,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
