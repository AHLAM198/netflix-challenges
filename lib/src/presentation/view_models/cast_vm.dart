import 'package:get/get.dart';
import 'package:netflix/src/domain/use_cases/get_movie_cast.dart';

class CastViewModel extends GetxController with StateMixin {
  final GetMovieCast movieCastUseCase;

  CastViewModel({
    required this.movieCastUseCase,
  });

  RxList movieCast = [].obs;

  Future<void> getMovieCast(movieId) async {
    final result = await movieCastUseCase.call(movieId);
    result.fold(
      (failure) {
        printInfo(info: "Fetching Recommended Movies Failed! >>> $failure.");
      },
      (data) {
        change(data, status: RxStatus.loading());
        movieCast.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
