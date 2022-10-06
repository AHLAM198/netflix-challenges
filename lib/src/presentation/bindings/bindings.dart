import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/src/data/data_sources/remote_data_source_impl.dart';
import 'package:netflix/src/data/repositories/movie_repository_impl.dart';
import 'package:netflix/src/data/repositories/show_repository_impl.dart';
import 'package:netflix/src/domain/use_cases/get_latest_movies.dart';
import 'package:netflix/src/domain/use_cases/get_movie_cast.dart';
import 'package:netflix/src/domain/use_cases/get_movie_info.dart';
import 'package:netflix/src/domain/use_cases/get_movie_videos.dart';
import 'package:netflix/src/domain/use_cases/get_now_playing_movies.dart';
import 'package:netflix/src/domain/use_cases/get_recommended_movies.dart';
import 'package:netflix/src/domain/use_cases/get_shows_airing_today.dart';
import 'package:netflix/src/domain/use_cases/get_similar-movies.dart';
import 'package:netflix/src/presentation/view_models/cast_vm.dart';
import 'package:netflix/src/presentation/view_models/home_vm.dart';
import 'package:netflix/src/presentation/view_models/movie_vm.dart';
import 'package:netflix/src/presentation/view_models/video_vm.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => http.Client());
    Get.lazyPut(
      () => RemoteDataSourceImpl(
        client: Get.find<http.Client>(),
      ),
    );
    Get.lazyPut(
      () => ShowRepositoryImpl(
        remoteDataSource: Get.find<RemoteDataSourceImpl>(),
      ),
    );
    Get.lazyPut(
      () => MovieRepositoryImpl(
        remoteDataSource: Get.find<RemoteDataSourceImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetLatestMovies(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetNowPlayingMovies(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetShowsAiringToday(
        repository: Get.find<ShowRepositoryImpl>(),
      ),
    );
    Get.put(
      HomeViewModel(
        getLatestMoviesUseCase: Get.find<GetLatestMovies>(),
        getNowPlayingMoviesUseCase: Get.find<GetNowPlayingMovies>(),
        getShowsAiringToday: Get.find<GetShowsAiringToday>(),
      ),
    );
    Get.lazyPut(
      () => GetMovieInfo(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetSimilarMovies(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetRecommendedMovies(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetMovieCast(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetMovieVideos(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.lazyPut(
      () => GetMovieVideos(
        repository: Get.find<MovieRepositoryImpl>(),
      ),
    );
    Get.put(
      MovieViewModel(
        movieInfoUseCase: Get.find<GetMovieInfo>(),
        similarMoviesUseCase: Get.find<GetSimilarMovies>(),
        recommendedMoviesUseCase: Get.find<GetRecommendedMovies>(),
      ),
    );
    Get.put(
      CastViewModel(
        movieCastUseCase: Get.find<GetMovieCast>(),
      ),
    );
    Get.put(
      VideoViewModel(
        movieVideosUseCase: Get.find<GetMovieVideos>(),
      ),
    );
  }
}
