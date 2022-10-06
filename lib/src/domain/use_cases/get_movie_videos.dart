import 'package:dartz/dartz.dart';
import 'package:netflix/src/domain/entities/video.dart';
import '../../domain/entities/cast.dart';
import '../../core/config/failure.dart';
import '../../domain/repositories/movie_repository.dart';

class GetMovieVideos {
  final MovieRepository repository;
  GetMovieVideos({required this.repository});

  Future<Either<Failure, List<Video>>> call(int movieId) async {
    return await repository.getMovieVideos(movieId);
  }
}
