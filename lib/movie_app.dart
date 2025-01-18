import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';

import 'core/routing/routes.dart';
import 'core/utils/app_theme.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(390, 1044), //844
      minTextAdapt: true,
      splitScreenMode: true, // Ensures better handling of screen split mode
      builder: (context, child) {
        return MaterialApp(
          initialRoute: Routes.kSplashView,
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
        );
      },
    );
  }
}