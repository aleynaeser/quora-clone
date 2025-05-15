import 'dart:convert';
import '../models/post.dart';
import 'package:http/http.dart' as http;

const _postLimit = 20;

class PostProvider {
  Future<List<Post>> fetchPosts({required int startIndex}) async {
    final response = await http.get(
      Uri.https('newsapi.org/v2', '/top-headlines', <String, String>{
        '_start': '$startIndex',
        '_limit': '$_postLimit',
      }),
    );

    if (response.statusCode == 200) {
      List<Post> data = [];

      final jsonData = json.decode(response.body) as List;

      for (var r in jsonData) {
        Post postData = Post.fromJson(r);
        data.add(postData);
      }

      return data.toList();
    }
    throw Exception('error fetching posts');
  }
}
