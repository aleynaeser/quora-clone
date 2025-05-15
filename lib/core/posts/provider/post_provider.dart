import 'dart:convert';
import 'dart:typed_data';
import '../../../common/constants/base_constants.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;

const _postLimit = 20;

class PostProvider {
  Future<PostResponse> fetchPosts({required int startIndex}) async {
    final response = await http.get(
      Uri.https(
        BaseInfo.newsApiUrl,
        BaseInfo.newsApiTopHeadlines,
        <String, String>{
          'page': '$startIndex',
          'pageSize': '$_postLimit',
          'apiKey': BaseInfo.newsApiKey,
          'category': BaseInfo.newsApiCategory,
          'country': BaseInfo.newsApiCountry,
          'language': BaseInfo.newsApiLanguage,
        },
      ),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final postResponse = PostResponse.fromJson(body);
      return postResponse;
    }

    throw Exception('Error fetching posts...');
  }

  Future<Uint8List?> loadImage(String? urlToImage) async {
    if (urlToImage == null) return null;

    try {
      final proxyUrl =
          'https://images.weserv.nl/?url=${Uri.encodeComponent(urlToImage)}';

      final response = await http.get(Uri.parse(proxyUrl));

      if (response.statusCode == 200) {
        return response.bodyBytes;
      }

      throw Exception('Error fetching image...');
    } catch (e) {
      return null;
    }
  }
}
