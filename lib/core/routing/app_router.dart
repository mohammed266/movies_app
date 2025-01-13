import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/service_lacator.dart';
import '../../features/home/data/repos/movie_details_repo/movie_details_repo_impl.dart';
import '../../features/home/data/repos/movies_repo/movies_repo_impl.dart';
import '../../features/home/data/repos/tv_series_repo/tv_series_repo_impl.dart';
import '../../features/home/data/repos/trending_moves_repo/trending_movies_repo_impl.dart';
import '../../features/home/presentation/manager/movie_details_cubit/movie_details_cubit.dart';
import '../../features/home/presentation/manager/movies_cubit/movies_cubit.dart';
import '../../features/home/presentation/manager/saved_item_cubit/saved_item_cubit.dart';
import '../../features/home/presentation/manager/trending_movies_cubit/trending_movies_cubit.dart';

import '../../features/auth/presentation/views/forget_pass_view.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/singup_view.dart';
import '../../features/home/presentation/manager/tv_series_cubit/tv_series_cubit.dart';
import '../../features/home/presentation/views/movie_details_view.dart';
import '../../features/home/presentation/views/my_home_view.dart';
import '../../features/home/presentation/views/tv_details_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../helpers/db_helper.dart';
import 'routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.kSplashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.kLoginView:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.kSingUpView:
        return MaterialPageRoute(builder: (_) => const SingUpView());
      case Routes.kMyHomeView:
        return MaterialPageRoute(builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      TrendingMoviesCubit(getIt.get<TrendingMoviesRepoImpl>())),
              BlocProvider(
                create: (context) =>
                    TvSeriesCubit(getIt.get<TvSeriesRepoImpl>()),
              ),
              BlocProvider(
                  create: (context) =>
                      MoviesCubit(getIt.get<MoviesRepoImpl>())),
              BlocProvider(
                create: (context) => SavedItemCubit(DatabaseHelper()),
              ),
            ],
            child: const MyHomeView(),
          );
        });
      case Routes.kForgetPassView:
        return MaterialPageRoute(builder: (_) => const ForgetPassView());
      case Routes.kMovieDetailsView:
        return MaterialPageRoute(builder: (_) {
          if (arguments != null) {
            // Assuming you expect an id or some specific type
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) =>
                        MovieDetailsCubit(getIt.get<MovieDetailsRepoImpl>())),
                BlocProvider(
                  create: (context) => SavedItemCubit(DatabaseHelper()),
                ),
              ],
              child: MovieDetailsView(movieId: arguments as int),
            );
          } else {
            return const Text('error>>>>>>>');
          }
        });
      case Routes.kTvDetailsView:
        return MaterialPageRoute(builder: (_) => const TvDetailsView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("NO route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
