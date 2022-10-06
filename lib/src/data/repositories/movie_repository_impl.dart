import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:netflix/src/core/config/exception.dart';
import 'package:netflix/src/core/config/failure.dart';
import 'package:netflix/src/data/data_sources/remote_data_source.dart';
import 'package:netflix/src/domain/entities/cast.dart';
import 'package:netflix/src/domain/entities/movie.dart';
import 'package:netflix/src/domain/entities/video.dart';
import 'package:netflix/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteDataSource remoteDataSource;
  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Movie>> getLatestMovie() async {
    try {
      final result = await remoteDataSource.getLatestMovie();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDataSource.getNowPlayingMovies();
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, Movie>> getMovieInfo(int movieId) async {
    try {
      final result = await remoteDataSource.getMovieInfo(movieId);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSimilarMovies(int movieId) async {
    try {
      final result = await remoteDataSource.getSimilarMovies(movieId);
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRecommendedMovies(int movieId) async {
    try {
      final result = await remoteDataSource.getRecommendedMovies(movieId);
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> getMovieCast(int movieId) async {
    try {
      final result = await remoteDataSource.getMovieCast(movieId);
      return Right(result.map((movie) => movie.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Video>>> getMovieVideos(int movieId) async {
    try {
      final result = await remoteDataSource.getMovieVideos(movieId);
      return Right(result.map((video) => video.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure('Failed to connect to the network'),
      );
    }
  }
}
