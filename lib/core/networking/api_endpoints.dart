
class ApiEndpoints {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = 'd5542daf3eb4561723e655ffbce3aba4';


  // auth

  static String getRequestToken() {
    return 'authentication/token/new?api_key=$apiKey';
  }

  static String validateWithLogin() {
    return 'authentication/token/validate_with_login?api_key=$apiKey';
  }

  static String createSession() {
    return 'authentication/session/new?api_key=$apiKey';
  }

  static String deleteSession() {
    return 'authentication/session?api_key=$apiKey';
  }
  //--------------------------------------------------

  // home
  static String getTrendingMovies({required String dOrW}) {
    return 'trending/all/$dOrW?api_key=$apiKey';
  }

  ///Tv series /////////////////////

  static String getPopularTvSeries() {
    return 'tv/popular?api_key=$apiKey';
  }
  static String getTopRatedTvSeries() {
    return 'tv/top_rated?api_key=$apiKey';
  }
  static String getOnAirTvSeries() {
    return 'tv/on_the_air?api_key=$apiKey';
  }

  /// movies ///////////////////////////

  static String getPopularMovies() {
    return 'movie/popular?api_key=$apiKey';
  }
  static String getTopRatedMovies() {
    return 'movie/top_rated?api_key=$apiKey';
  }
  static String getNowPlayingMovies() {
    return 'movie/now_playing?api_key=$apiKey';
  }
  static String getUpcomingMovies() {
    return 'movie/upcoming?api_key=$apiKey';
  }

  /// movie details ///////////

  static String getMovieDetails(int id) {
    return 'movie/$id?api_key=$apiKey';
  }

  static String getMovieReviews(int id) {
    return 'movie/$id/reviews?api_key=$apiKey';
  }

  static String getSimilarMovie(int id) {
    return 'movie/$id/similar?api_key=$apiKey';
  }

  static String getRecommendMovie(int id) {
    return 'movie/$id/recommendations?api_key=$apiKey';
  }

  static String getMovieTrailers(int id) {
    return 'movie/$id/videos?api_key=$apiKey';
  }

  /// search //////////////////

  static String getSearchData(String searchText) {
    return 'search/multi?api_key=$apiKey&query=$searchText';
  }

  //-----------------------------------------------------

}
