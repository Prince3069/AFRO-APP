import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article_model.dart';

class NewsService {
  static const String apiKey = 'pub_6830182f41e0e138af3e5f3efd4eb8040712d';
  static const String baseUrl = 'https://newsdata.io/api/1/news';

  static Future<List<Article>> fetchArticles({
    required String country,
    required String category,
    String query = '',
  }) async {
    // Construct base URL
    String apiUrl = '$baseUrl?apikey=$apiKey&language=en';

    // Add optional parameters only if they are non-empty
    if (country.isNotEmpty) apiUrl += '&country=$country';
    if (category.isNotEmpty) apiUrl += '&category=$category';
    if (query.isNotEmpty) apiUrl += '&q=$query';

    print("🔍 API Request: $apiUrl"); // Debugging

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success' && data['results'] != null) {
          return (data['results'] as List)
              .map((json) => Article.fromJson(json))
              .toList();
        } else {
          throw Exception('No articles found.');
        }
      } else if (response.statusCode == 422) {
        throw Exception('Invalid request: ${response.body}');
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (error) {
      print("🚨 Error: $error");
      throw Exception('Failed to fetch news');
    }
  }
}
