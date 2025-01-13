import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routing/app_router.dart';

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

// API key d5542daf3eb4561723e655ffbce3aba4

//app url https://play.google.com/store/apps/details?id=com.yourcompany.yourapp

// API Read Access Token

//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNTU0MmRhZjNlYjQ1NjE3MjNlNjU1ZmZiY2UzYWJhNCIsIm5iZiI6MTcyOTY5NDI5Mi4wMjEsInN1YiI6IjY3MTkwYTU0MjY4NWNiNjU2M2MwN2M1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8inv3-VJumrvN-mMWTHO7ldz65RTY0MOmd0m2i_zlBg

