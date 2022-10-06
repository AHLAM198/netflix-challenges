import 'dart:convert';

import 'package:netflix/src/core/utils/api_path.dart';
import 'package:netflix/src/core/config/exception.dart';
import 'package:netflix/src/data/data_sources/remote_data_source.dart';
import 'package:netflix/src/data/models/cast_model.dart';
import 'package:netflix/src/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/src/data/models/show_model.dart';
import 'package:netflix/src/data/models/video_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  const RemoteDataSourceImpl({required this.client});

  /* === Movies Functions === */
  @override
  Future<MovieModel> getLatestMovie() async {
    final response = await client.get(
      Uri.parse(
        AppConstants.latestMovies,
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return MovieModel.fromJson(responseData);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse(
        AppConstants.nowPlayingMovies,
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['results'];
      List<MovieModel> nowPlayingMovies = [];
      nowPlayingMovies =
          responseData.map((movie) => MovieModel.fromJson(movie)).toList();
      return nowPlayingMovies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieModel> getMovieInfo(int movieId) async {
    final response = await client.get(
      Uri.parse(
        AppConstants.movieInfo(movieId),
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return MovieModel.fromJson(responseData);
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    final response = await client.get(
      Uri.parse(
        AppConstants.similarMovies(movieId),
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['results'];
      List<MovieModel> getSimilarMovies = [];
      getSimilarMovies =
          responseData.map((movie) => MovieModel.fromJson(movie)).toList();
      return getSimilarMovies;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future<List<MovieModel>> getRecommendedMovies(int movieId) async {
    final response = await client.get(
      Uri.parse(
        AppConstants.recommendedMovies(movieId),
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['results'];
      List<MovieModel> getRecommendedMovies = [];
      getRecommendedMovies =
          responseData.map((movie) => MovieModel.fromJson(movie)).toList();
      return getRecommendedMovies;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future<List<CastModel>> getMovieCast(int movieId) async {
    final response = await client.get(
      Uri.parse(
        AppConstants.movieCast(movieId),
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['cast'];
      List<CastModel> getMovieCast = [];
      getMovieCast =
          responseData.map((movie) => CastModel.fromJson(movie)).toList();
      return getMovieCast;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    final response = await client.get(
      Uri.parse(
        AppConstants.movieVideos(movieId),
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['results'];
      List<VideoModel> movieVideos = [];
      movieVideos =
          responseData.map((video) => VideoModel.fromJson(video)).toList();
      return movieVideos;
    } else {
      throw response.statusCode;
    }
  }

  @override
  Future<List<ShowModel>> getShowsAiringToday() async {
    final response = await client.get(
      Uri.parse(
        AppConstants.showsAiringToday,
      ),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': AppConstants.apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List responseData = jsonDecode(response.body)['results'];
      List<ShowModel> showsAiringToday = [];
      showsAiringToday =
          responseData.map((show) => ShowModel.fromJson(show)).toList();
      return showsAiringToday;
    } else {
      throw ServerException();
    }
  }
}
