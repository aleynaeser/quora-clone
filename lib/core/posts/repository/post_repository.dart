import '../models/post.dart';
import '../provider/post_provider.dart';

class PostRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> fetchPosts({required int startIndex}) async {
    return await _postProvider.fetchPosts(startIndex: startIndex);
  }
}
