import 'package:equatable/equatable.dart';
import 'package:netflix/src/domain/entities/cast.dart';

class CastModel extends Equatable {
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

  const CastModel({
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

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json['adult'],
        gender: json['gender'],
        id: json['id'],
        department: json['known_for_department'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity'],
        profilePath: json['profile_path'] ?? '',
        castId: json['cast_id'],
        character: json['character'],
        creditId: json['credit_id'],
        order: json['order'],
      );

  Cast toEntity() => Cast(
        adult: adult,
        gender: gender,
        id: id,
        department: department,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        castId: castId,
        character: character,
        creditId: creditId,
        order: order,
      );

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
