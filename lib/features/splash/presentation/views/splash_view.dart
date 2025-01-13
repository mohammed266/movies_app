

import 'package:flutter/material.dart';
import '../../../../core/resources/colors.dart';
import '../../../../core/routing/routes.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 4),
      () =>  Navigator.pushNamed(context, Routes.kLoginView),
    );
  }
}
