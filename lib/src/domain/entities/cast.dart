import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final bool adult;
  final int gender;
  final int id;
  final String department;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.department,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        department,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
      ];
}
