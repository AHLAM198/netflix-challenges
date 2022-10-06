import 'dart:developer';

import 'package:get/get.dart';
import 'package:netflix/src/domain/use_cases/get_movie_videos.dart';

class VideoViewModel extends GetxController with StateMixin {
  final GetMovieVideos movieVideosUseCase;

  VideoViewModel({
    required this.movieVideosUseCase,
  });

  RxList movieVideos = [].obs;

  Future<void> getMovieVideos(movieId) async {
    final result = await movieVideosUseCase.call(movieId);
    result.fold(
      (failure) {
        printInfo(info: "Fetching Movie Videos Failed! >>> $failure.");
      },
      (data) {
        change(data, status: RxStatus.loading());
        movieVideos.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
