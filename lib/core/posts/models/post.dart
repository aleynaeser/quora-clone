import 'dart:math';
import 'package:equatable/equatable.dart';
import '../../../common/constants/base_constants.dart';

final class PostResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Post> articles;

  const PostResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
    status: json['status'],
    totalResults: json['totalResults'],
    articles:
        (json['articles'] as List)
            .map((article) => Post.fromJson(article))
            .toList(),
  );

  @override
  List<Object> get props => [status, totalResults, articles];
}

final class Post {
  final PostSource source;
  final String? author;
  final String authorImage;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  static String _getRandomAvatarUrl() {
    final random = Random();
    final id = random.nextInt(100) + 1; // 1 to 100
    return '${BaseInfo.avatarUrl}/$id';
  }

  const Post({
    required this.source,
    this.author,
    required this.authorImage,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  List<Object?> get props => [
    source,
    author,
    authorImage,
    title,
    description,
    url,
    urlToImage,
    publishedAt,
    content,
  ];

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    source: PostSource(
      id: json['source']['id'] ?? '',
      name: json['source']['name'] ?? '',
    ),
    author: json['author'] ?? '',
    authorImage: _getRandomAvatarUrl(),
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    url: json['url'] ?? '',
    urlToImage: json['urlToImage'] ?? '',
    publishedAt: json['publishedAt'] ?? '',
    content: json['content'] ?? '',
  );
}

final class PostSource {
  final String id;
  final String name;

  PostSource({required this.id, required this.name});
}
