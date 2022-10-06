import 'package:get/get.dart';
import 'package:netflix/src/domain/use_cases/get_movie_info.dart';
import 'package:netflix/src/domain/use_cases/get_recommended_movies.dart';
import 'package:netflix/src/domain/use_cases/get_similar-movies.dart';

class MovieViewModel extends GetxController with StateMixin {
  final GetMovieInfo movieInfoUseCase;
  final GetSimilarMovies similarMoviesUseCase;
  final GetRecommendedMovies recommendedMoviesUseCase;

  MovieViewModel({
    required this.movieInfoUseCase,
    required this.similarMoviesUseCase,
    required this.recommendedMoviesUseCase,
  });

  Rx<String> originalLanguage = "".obs;
  Rx<String> overview = "".obs;
  Rx<String> originalTitle = "".obs;
  Rx<String> homePage = "".obs;
  Rx<String> popularity = "".obs;
  Rx<String> posterPath = "".obs;
  Rx<String> releaseDate = "".obs;
  Rx<String> revenue = "".obs;
  Rx<String> language = "".obs;
  Rx<int> runtime = 0.obs;
  RxBool adult = false.obs;
  Rx<String> tagline = "".obs;
  Rx<String> movieStatus = "".obs;
  Rx<String> title = "".obs;
  RxList genres = [].obs;

  Future<void> getMovieInfo(movieId) async {
    final result = await movieInfoUseCase.call(movieId);
    result.fold(
      (failure) {
        printInfo(info: "Movie Info Fetching Failed! >>> $failure.");
      },
      (data) {
        change(data, status: RxStatus.loading());
        movieId = data.id;
        title.value = data.title;
        overview.value = data.overview;
        releaseDate.value = data.releaseDate;
        language.value = data.language;
        runtime.value = data.runtime;
        posterPath.value = data.posterPath;
        genres.value = data.genres;
        adult.value = data.adult;
        change(data, status: RxStatus.success());
      },
    );
  }

  RxList similarMovies = [].obs;
  RxList recommendedMovies = [].obs;

  // list of similar movies
  Future<void> getSimilarMovies(movieId) async {
    final result = await similarMoviesUseCase.call(movieId);
    result.fold(
      (failure) {
        printInfo(info: "Fetching Similar Movies Failed! >>> $failure.");
      },
      (data) {
        change(data, status: RxStatus.loading());
        similarMovies.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }

  // list of similar movies
  Future<void> getRecommendedMovies(movieId) async {
    final result = await recommendedMoviesUseCase.call(movieId);
    result.fold(
      (failure) {
        printInfo(info: "Fetching Recommended Movies Failed! >>> $failure.");
      },
      (data) {
        change(data, status: RxStatus.loading());
        recommendedMovies.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
