import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/domain/entities/cast.dart';
import 'package:netflix/src/domain/entities/movie.dart';
import 'package:netflix/src/domain/entities/video.dart';

abstract class MovieRepository {
  Future<Either<Failure, Movie>> getLatestMovie();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, Movie>> getMovieInfo(int movieId);
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId);
  Future<Either<Failure, List<Movie>>> getRecommendedMovies(int movieId);
  Future<Either<Failure, List<Cast>>> getMovieCast(int movieId);
  Future<Either<Failure, List<Video>>> getMovieVideos(int movieId);
}
