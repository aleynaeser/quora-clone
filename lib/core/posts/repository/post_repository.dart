import 'dart:typed_data';
import '../models/post.dart';
import '../provider/post_provider.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<PostResponse> fetchPosts({required int startIndex}) async {
    return await _postProvider.fetchPosts(startIndex: startIndex);
  }

  Future<Uint8List?> loadImage(String? urlToImage) async {
    return await _postProvider.loadImage(urlToImage);
  }
}
