import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import 'movies.dart';
import 'tv_series.dart';
import 'up_coming.dart';

class TabBarItem extends StatefulWidget {
  const TabBarItem({super.key});

  @override
  State<TabBarItem> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            physics: const BouncingScrollPhysics(),
            isScrollable: false,
            controller: tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.amber.withOpacity(0.4)),
            tabs: [
              Tab(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Tv Series',
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Movies',
                    style: Styles.textStyle14,
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Upcoming',
                    style: Styles.textStyle14,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1300.h,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            controller: tabController,
            children: const [
              TvSeries(),
              Movies(),
              UpComing(),
            ],
          ),
        ),
      ],
    );
  }
}
