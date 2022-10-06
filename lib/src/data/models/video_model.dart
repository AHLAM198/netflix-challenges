import 'package:equatable/equatable.dart';
import 'package:netflix/src/domain/entities/video.dart';

class VideoModel extends Equatable {
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const VideoModel({
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"],
        id: json["id"],
      );

  Video toEntity() => Video(
        name: name,
        key: key,
        site: site,
        size: size,
        type: type,
        official: official,
        publishedAt: publishedAt,
        id: id,
      );

  @override
  List<Object?> get props => [
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];
}
