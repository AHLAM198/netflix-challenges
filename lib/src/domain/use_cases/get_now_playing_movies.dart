import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/domain/entities/movie.dart';
import 'package:netflix/src/domain/repositories/movie_repository.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;
  GetNowPlayingMovies({required this.repository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await repository.getNowPlayingMovies();
  }
}
