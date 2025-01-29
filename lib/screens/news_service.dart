import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article_model.dart';

class NewsService {
  static const String apiKey =
      'b9d99482a53e4197bbde81cfef9f3852'; // Replace with your actual API key

  static Future<List<Article>> fetchArticles({
    required String country,
    required String category,
  }) async {
    String url = 'https://newsapi.org/v2/everything?q=$category&apiKey=$apiKey';

    if (country.isNotEmpty) {
      url =
          'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey';
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> articlesJson = jsonResponse['articles'];
        return articlesJson.map((json) => Article.fromMap(json)).toList();
      } else {
        throw Exception('Failed to load articles. HTTP ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load articles: $error');
    }
  }
}
