import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/movie_details_repo/movie_details_repo_impl.dart';
import '../../features/home/data/repos/movies_repo/movies_repo_impl.dart';
import '../../features/home/data/repos/search_repo/search_repo_impl.dart';
import '../../features/home/data/repos/trending_moves_repo/trending_movies_repo_impl.dart';
import '../../features/home/data/repos/tv_series_repo/tv_series_repo_impl.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //dio & ApiService
  Dio dio = await DioFactory.getInstance();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  //repos
  getIt.registerSingleton<TrendingMoviesRepoImpl>(
      TrendingMoviesRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<TvSeriesRepoImpl>(
      TvSeriesRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<MoviesRepoImpl>(
      MoviesRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<MovieDetailsRepoImpl>(
      MovieDetailsRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiService>()));

}
