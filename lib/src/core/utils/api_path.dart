class AppConstants {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = "af233f03d0ac4520aa6ac7eeec7339ca";
  static const language = "en-US";

  // movies api urls
  static String get latestMovies =>
      '$baseUrl/movie/latest?api_key=$apiKey&language=$language';
  static String get nowPlayingMovies =>
      '$baseUrl/movie/now_playing?api_key=$apiKey&language=$language&page=1';

  /* === Movie Data === */
  static String movieInfo(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey&language=$language';

  static String similarMovies(int movieId) =>
      '$baseUrl/movie/$movieId/similar?api_key=$apiKey&language=$language';

  static String recommendedMovies(int movieId) =>
      '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey&language=$language';

  static String movieCast(int movieId) =>
      '$baseUrl/movie/$movieId/credits?api_key=$apiKey&language=$language';

  static String movieVideos(int movieId) =>
      '$baseUrl/movie/$movieId/videos?api_key=$apiKey&language=$language';

  // shows api urls
  static String get showsAiringToday =>
      '$baseUrl/tv/airing_today?api_key=$apiKey&language=$language';
}
