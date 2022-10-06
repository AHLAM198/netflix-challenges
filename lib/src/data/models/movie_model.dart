import 'package:equatable/equatable.dart';
import 'package:netflix/src/domain/entities/movie.dart';

class MovieModel extends Equatable {
  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String overview;
  final String posterPath;
  final double popularity;
  // final double voteAverage;
  final bool video;
  final String releaseDate;
  final String language;
  final String status;
  final String tagline;
  final int runtime;
  final List genres;

  const MovieModel({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    // required this.voteAverage,
    required this.video,
    required this.releaseDate,
    required this.language,
    required this.adult,
    required this.status,
    required this.tagline,
    required this.runtime,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        title: json['title'],
        overview: json['overview'],
        posterPath: json['poster_path'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        popularity: json['popularity'],
        // voteAverage: json['vote_average'],
        video: json['video'],
        releaseDate: json['release_date'],
        language: json['original_language'],
        adult: json['adult'],
        status: json['status'] ?? '',
        tagline: json['tagline'] ?? '',
        runtime: json['runtime'] ?? 0,
        genres: json['genres'] ?? [],
      );

  Movie toEntity() => Movie(
        id: id,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        title: title,
        overview: overview,
        posterPath: posterPath,
        backdropPath: backdropPath,
        popularity: popularity,
        // voteAverage: voteAverage,
        video: video,
        language: language,
        releaseDate: releaseDate,
        adult: adult,
        status: status,
        tagline: tagline,
        runtime: runtime,
        genres: genres,
      );

  @override
  List<Object?> get props => [
        id,
        originalLanguage,
        originalTitle,
        title,
        overview,
        posterPath,
        backdropPath,
        popularity,
        // voteAverage,
        video,
        releaseDate,
        language,
        adult,
        status,
        tagline,
        genres,
        title,
      ];
}
