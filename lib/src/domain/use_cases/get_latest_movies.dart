import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/domain/entities/movie.dart';
import 'package:netflix/src/domain/repositories/movie_repository.dart';

class GetLatestMovies {
  final MovieRepository repository;
  GetLatestMovies({required this.repository});

  Future<Either<Failure, Movie>> call() async {
    return await repository.getLatestMovie();
  }
}
