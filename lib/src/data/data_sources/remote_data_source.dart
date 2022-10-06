import 'package:netflix/src/data/models/cast_model.dart';
import 'package:netflix/src/data/models/movie_model.dart';
import 'package:netflix/src/data/models/show_model.dart';
import 'package:netflix/src/data/models/video_model.dart';

abstract class RemoteDataSource {
  Future<MovieModel> getLatestMovie();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<MovieModel> getMovieInfo(int movieId);
  Future<List<MovieModel>> getSimilarMovies(int movieId);
  Future<List<MovieModel>> getRecommendedMovies(int movieId);
  Future<List<CastModel>> getMovieCast(int movieId);
  Future<List<VideoModel>> getMovieVideos(int movieId);
  Future<List<ShowModel>> getShowsAiringToday();
}
