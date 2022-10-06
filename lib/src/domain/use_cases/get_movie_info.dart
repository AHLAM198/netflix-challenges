import 'package:dartz/dartz.dart';
import '../../core/config/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';

class GetMovieInfo {
  final MovieRepository repository;
  GetMovieInfo({required this.repository});

  Future<Either<Failure, Movie>> call(int movieId) async {
    return await repository.getMovieInfo(movieId);
  }
}
