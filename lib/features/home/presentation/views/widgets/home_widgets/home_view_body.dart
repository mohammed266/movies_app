import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/widgets/carousel_slider.dart';
import 'sliver_app_bar_title.dart';
import 'tab_bar_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromRGBO(18, 18, 18, 0.9),
            title: SliverAppBarTitle(scaffoldKey: scaffoldKey),
            centerTitle: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 60.h,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: const FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: CarouselSliderList(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.h),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const TabBarItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}