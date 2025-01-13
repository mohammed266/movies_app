import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/styles.dart';
import '../../../../data/model/movie/trending_movies_model.dart';

class TrendingContainerItem extends StatelessWidget {
  const TrendingContainerItem({
    super.key,
    required this.data,
    required this.index,
  });
  final Movie data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.fill,
          image:
              NetworkImage('https://image.tmdb.org/t/p/w500${data.posterPath}'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 6),
                child: Text(
                  ' # '
                  '${index + 1}',
                  style: Styles.textStyle18.copyWith(
                    color: Colors.amber.withOpacity(.7),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 8, bottom: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //rating icon
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      data.voteAverage.toStringAsFixed(2),
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
