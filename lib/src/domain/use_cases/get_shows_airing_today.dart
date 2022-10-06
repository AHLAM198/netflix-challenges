import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/domain/entities/show.dart';
import 'package:netflix/src/domain/repositories/show_repository.dart';

class GetShowsAiringToday {
  final ShowRepository repository;
  GetShowsAiringToday({required this.repository});

  Future<Either<Failure, List<Show>>> call() async {
    return await repository.getShowsAiringToday();
  }
}
