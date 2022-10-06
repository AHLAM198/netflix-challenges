import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/domain/entities/show.dart';

abstract class ShowRepository {
  Future<Either<Failure, List<Show>>> getShowsAiringToday();
}
