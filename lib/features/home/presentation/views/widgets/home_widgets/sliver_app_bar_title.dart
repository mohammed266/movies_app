import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../manager/trending_movies_cubit/trending_movies_cubit.dart';

class SliverAppBarTitle extends StatefulWidget {
  const SliverAppBarTitle({super.key});

  @override
  State<SliverAppBarTitle> createState() => _SliverAppBarTitleState();
}

class _SliverAppBarTitleState extends State<SliverAppBarTitle> {
  String uVal = 'day'; // Variable to store the selected value

  @override
  void initState() {
    super.initState();
    // Fetch movies for the initial value
    context.read<TrendingMoviesCubit>().fetchTrendingMoviesList(uVal);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Trending' ' 🔥',
          style: Styles.textStyle16,
        ),
        SizedBox(width: 10.w),
        Container(
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: DropdownButton<String>(
              autofocus: true,
              underline: Container(height: 0, color: Colors.transparent),
              dropdownColor: Colors.black.withOpacity(0.6),
              icon: const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.amber,
                size: 30,
              ),
              value: uVal,
              items: [
                DropdownMenuItem(
                  value: 'week',
                  child: Text(
                    'Weekly',
                    style: Styles.textStyle16,
                  ),
                ),
                DropdownMenuItem(
                  value: 'day',
                  child: Text(
                    'Daily',
                    style: Styles.textStyle16,
                  ),
                ),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    uVal = value; // Update the selected value
                  });
                  // Pass the selected value to the cubit
                  context
                      .read<TrendingMoviesCubit>()
                      .fetchTrendingMoviesList(uVal);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
