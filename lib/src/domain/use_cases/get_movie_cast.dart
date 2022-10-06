import 'package:dartz/dartz.dart';
import '../../domain/entities/cast.dart';
import '../../core/config/failure.dart';
import '../../domain/repositories/movie_repository.dart';

class GetMovieCast {
  final MovieRepository repository;
  GetMovieCast({required this.repository});

  Future<Either<Failure, List<Cast>>> call(int movieId) async {
    return await repository.getMovieCast(movieId);
  }
}