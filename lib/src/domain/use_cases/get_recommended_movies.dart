import 'package:dartz/dartz.dart';
import '../../core/config/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';

class GetRecommendedMovies {
  final MovieRepository repository;
  GetRecommendedMovies({required this.repository});

  Future<Either<Failure, List<Movie>>> call(int movieId) async {
    return await repository.getRecommendedMovies(movieId);
  }
}
