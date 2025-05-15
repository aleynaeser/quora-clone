import 'package:equatable/equatable.dart';

class PostSource {
  final String id;
  final String name;

  PostSource({required this.id, required this.name});
}

final class Post extends Equatable {
  final PostSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Post({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object> get props => [
    source,
    author,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    source: PostSource(id: json['source']['id'], name: json['source']['name']),
    author: json['author'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
    content: json['content'],
  );
}
