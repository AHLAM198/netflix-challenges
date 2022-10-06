import 'package:get/get.dart';
import '../../domain/use_cases/get_latest_movies.dart';
import '../../domain/use_cases/get_now_playing_movies.dart';
import '../../domain/use_cases/get_shows_airing_today.dart';

class HomeViewModel extends GetxController with StateMixin {
  final GetLatestMovies getLatestMoviesUseCase;
  final GetNowPlayingMovies getNowPlayingMoviesUseCase;
  final GetShowsAiringToday getShowsAiringToday;

  HomeViewModel({
    required this.getLatestMoviesUseCase,
    required this.getNowPlayingMoviesUseCase,
    required this.getShowsAiringToday,
  });

  Rx<String> posterPath = "".obs;
  Rx<String> title = "".obs;
  Rx<String> tagline = "".obs;
  RxBool adult = false.obs;
  Rx<int> id = 0.obs;
  RxList nowPlayingMovies = [].obs;
  RxList showsAiringToday = [].obs;

  @override
  void onInit() {
    _getLatestMovie();
    _getNowPlayingMovies();
    _getShowsAiringToday();
    super.onInit();
  }

  Future<void> _getLatestMovie() async {
    final result = await getLatestMoviesUseCase.call();
    result.fold(
      (failure) {
        printInfo(info: "Data fetching failed! >>> $failure");
      },
      (data) {
        change(data, status: RxStatus.loading());
        posterPath.value = data.posterPath;
        title.value = data.title;
        tagline.value = data.tagline;
        adult.value = data.adult;
        id.value = data.id;
        change(data, status: RxStatus.success());
      },
    );
  }

  Future<void> _getNowPlayingMovies() async {
    final result = await getNowPlayingMoviesUseCase.call();
    result.fold(
      (failure) {
        printInfo(info: "Data fetching failed! >>> $failure");
      },
      (data) {
        change(data, status: RxStatus.loading());
        nowPlayingMovies.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }

  Future<void> _getShowsAiringToday() async {
    final result = await getShowsAiringToday.call();
    result.fold(
      (failure) {
        printInfo(info: "Data fetching failed! >>> $failure");
      },
      (data) {
        change(data, status: RxStatus.loading());
        showsAiringToday.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
