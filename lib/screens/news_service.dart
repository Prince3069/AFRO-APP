// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'article_model.dart';

// class NewsService {
//   static Future<List<Article>> fetchArticles({
//     required String country,
//     required String category,
//     required String query,
//   }) async {
//     try {
//       final String apiUrl =
//           'https://newsdata.io/api/1/news?apikey=pub_68301565bc62bb3751e97b6e2e714e8567843&language=en&country=$country&category=$category${query.isNotEmpty ? '&q=$query' : ''}';

//       print("Fetching from: $apiUrl");

//       final response = await http.get(Uri.parse(apiUrl));
//       print("Raw API Response: ${response.body}");

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List<dynamic> articlesJson = jsonData['results'] ?? [];

//         print("Total Articles Found: ${articlesJson.length}");

//         return articlesJson.map((data) => Article.fromJson(data)).toList();
//       } else {
//         print("Error: ${response.statusCode} - ${response.body}");
//         return [];
//       }
//     } catch (e) {
//       print("API Fetch Error: $e");
//       return [];
//     }
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'article_model.dart';

// class NewsService {
//   static Future<List<Article>> fetchArticles({
//     required String country,
//     required String category,
//     required String query,
//   }) async {
//     try {
//       final String apiUrl =
//           'https://newsdata.io/api/1/news?apikey=pub_6830140272e8ac41ce0dbe6289add888aca0c&language=en&country=$country&category=$category${query.isNotEmpty ? '&q=$query' : ''}';

//       print("Fetching from: $apiUrl");

//       final response = await http.get(Uri.parse(apiUrl));
//       print("Raw API Response: ${response.body}");

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> jsonData = json.decode(response.body);
//         final List<dynamic> articlesJson = jsonData['results'] ?? [];

//         print("Total Articles Found: ${articlesJson.length}");

//         // Convert JSON to Article objects and filter out articles with missing images
//         List<Article> articles =
//             articlesJson
//                 .map((data) => Article.fromJson(data))
//                 .where((article) => _isValidImageUrl(article.imageUrl))
//                 .toList();

//         print("Filtered Articles with Valid Images: ${articles.length}");
//         return articles;
//       } else {
//         print("Error: ${response.statusCode} - ${response.body}");
//         return [];
//       }
//     } catch (e) {
//       print("API Fetch Error: $e");
//       return [];
//     }
//   }

//   // Helper function to validate image URLs
//   static bool _isValidImageUrl(String? imageUrl) {
//     if (imageUrl == null || imageUrl.isEmpty) return false;

//     Uri? uri = Uri.tryParse(imageUrl);
//     return uri != null && uri.hasAbsolutePath;
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article_model.dart';

class NewsService {
  static Future<List<Article>> fetchArticles({
    required String country,
    required String category,
    required String query,
  }) async {
    try {
      final String apiUrl =
          'https://newsdata.io/api/1/news?apikey=pub_6830140272e8ac41ce0dbe6289add888aca0c&language=en&country=$country&category=$category${query.isNotEmpty ? '&q=$query' : ''}';

      print("Fetching from: $apiUrl");

      final response = await http.get(Uri.parse(apiUrl));
      print("Raw API Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> articlesJson = jsonData['results'] ?? [];

        print("Total Articles Found: ${articlesJson.length}");

        // Map API response to Article model
        List<Article> articles =
            articlesJson
                .map((data) => Article.fromJson(data))
                .where(
                  (article) => article.imageUrl.isNotEmpty,
                ) // ✅ Only keep articles with valid images
                .toList();

        print("Filtered Articles with Valid Images: ${articles.length}");

        return articles;
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
        return [];
      }
    } catch (e) {
      print("API Fetch Error: $e");
      return [];
    }
  }
}
