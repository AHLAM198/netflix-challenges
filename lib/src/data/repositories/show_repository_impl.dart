import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/exception.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/data/data_sources/remote_data_source.dart';
import 'package:netflix/src/domain/entities/show.dart';
import 'package:netflix/src/domain/repositories/show_repository.dart';

class ShowRepositoryImpl implements ShowRepository {
  final RemoteDataSource remoteDataSource;
  ShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Show>>> getShowsAiringToday() async {
    try {
      final result = await remoteDataSource.getShowsAiringToday();
      return Right(result.map((show) => show.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}
