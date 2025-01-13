import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import '../manager/search_cubit/search_cubit.dart';

import '../../../../core/di/service_lacator.dart';
import '../../data/repos/search_repo/search_repo_impl.dart';
import 'home_view.dart';
import 'saved_items_view.dart';
import 'search_view.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    BlocProvider(
      create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
      child: const SearchView(),
    ),
    const SavedItemsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              activeColor: Colors.black,
              iconSize: 30.r,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: 'Saved',
                ),
              ],
              selectedIndex: currentIndex,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
final List<String> imgList = [
  'https://images.ctfassets.net/nwksj2ft7iku/5Hk6ZrfzDc1oHNYb08yehy/030a9b6092127b856328301371117e50/240510_GOTC_TopBannerImage_LIGHTBG_Dragons_1440x720_EN.png',
  'https://i.ytimg.com/vi/O1gFxMoBAVw/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA0wrPQK0a1Q2zFWWz_N2woRjT6Tg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSNnUueTjF6ylFEBYQ75N-wmcYsDu-R9PU3w&s',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrXMh2sCb4upb2rHvrvJhaJua2n97nk9l4-Q&s',
  'https://ntvb.tmsimg.com/assets/p22067809_b_h8_ag.jpg?w=960&h=540',
];

