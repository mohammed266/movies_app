import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/service_lacator.dart';
import 'core/routing/app_router.dart';

import 'movie_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setupServiceLocator();
  runApp(MovieApp(
    appRouter: AppRouter(),
  ));
}
