import 'package:hive/hive.dart';

part 'anime.g.dart';

@HiveType(typeId: 0)
class Anime extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String url;

  @HiveField(3)
  final String trailerUrl;

  @HiveField(4)
  bool isLiked;
  @HiveField(5)
  final String imageUrl;

  Anime({required this.name,required this.imageUrl, required this.title, required this.url, required this.trailerUrl, this.isLiked = false});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      name: json['title'],
      title: json['title_english'] ?? json['title'],
      url: json['url'],
      trailerUrl: json['trailer']['url'] ?? '',
      imageUrl: json['images']['jpg']['image_url'] ?? '',
    );
  }
}
