import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseInfo {
  static const String appName = 'Quora Clone App';
  static const String version = '1.0.0';
  static const String packageName = 'com.example.quora_clone_app';
  static const String buildNumber = '1';

  static String newsApiUrl = dotenv.env['NEWS_API_URL'] ?? '';
  static String newsApiKey = dotenv.env['NEWS_API_KEY'] ?? '';
  static const String newsApiTopHeadlines = "v2/top-headlines";
  static const String newsApiCountry = "us";
  static const String newsApiLanguage = "en";
  static const String newsApiCategory = "technology";

  static const String avatarUrl = "https://avatar.iran.liara.run/public";
}
