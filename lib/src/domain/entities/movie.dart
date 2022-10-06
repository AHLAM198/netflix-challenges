import 'package:equatable/equatable.dart';

class Movie extends Equatable {
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
  final String status;
  final String tagline;
  final String language;
  final int runtime;
  final List genres;

  const Movie({
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
    required this.adult,
    required this.status,
    required this.tagline,
    required this.runtime,
    required this.language,
    required this.genres,
  });

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
        adult,
        status,
        language,
        tagline,
        genres,
        title,
      ];
}
