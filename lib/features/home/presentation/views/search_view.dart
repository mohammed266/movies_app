import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'widgets/search_widgets/custom_search_field.dart';
import 'widgets/search_widgets/search_result_list.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Padding(
          padding: buildEdgeInsets(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchField(),
              20.verticalSpace,
              Text(
                'Search Result :',
                style: Styles.textStyle18,
              ),
              20.verticalSpace,
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return Center(
                      heightFactor: 18.h,
                      child: const CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  } else if (state is SearchSuccess) {
                    return SearchResultList(searchList: state.searchList);
                  } else {
                    return Center(
                      heightFactor: 12,
                      child: Text(
                        'Start Searching...',
                        style: Styles.textStyle18,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets buildEdgeInsets() {
    return EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      top: 40.h,
      bottom: 16.h,
    );
  }
}
