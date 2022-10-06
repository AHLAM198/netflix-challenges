import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;
  final String id;

  const Video({
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

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
