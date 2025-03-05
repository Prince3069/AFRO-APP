// import 'package:flutter/foundation.dart';

// class Article {
//   final String title;
//   final String content;
//   final String url;
//   final String imageUrl;
//   final String? videoUrl;
//   final String source;
//   final String publishedDate;

//   Article({
//     required this.title,
//     required this.content,
//     required this.url,
//     required this.imageUrl,
//     this.videoUrl,
//     required this.source,
//     required this.publishedDate,
//   });

//   factory Article.fromJson(Map<String, dynamic> json) {
//     return Article(
//       title: json['title'] ?? 'No Title',
//       content: json['description'] ?? 'No Description',
//       url: json['url'] ?? '',
//       imageUrl: _getImageUrl(json),
//       videoUrl: json['video_url'],
//       source: json['source'] ?? 'Unknown',
//       publishedDate: _parseDate(json['published_at']),
//     );
//   }

//   // Robust image URL extraction
//   static String _getImageUrl(Map<String, dynamic> json) {
//     // Check multiple possible image keys with null and type safety
//     final possibleImageKeys = ['image', 'image_url', 'urlToImage'];

//     for (var key in possibleImageKeys) {
//       if (json[key] != null &&
//           json[key] is String &&
//           (json[key] as String).isNotEmpty) {
//         return json[key];
//       }
//     }

//     // Fallback to placeholder if no image found
//     return 'https://via.placeholder.com/150';
//   }

//   static String _parseDate(dynamic date) {
//     if (date == null || date is! String) return 'No Date';
//     return date;
//   }
// }
class Article {
  final String title;
  final String content;
  final String url;
  final String imageUrl;
  final String? videoUrl;
  final String source;
  final DateTime publishedDate;

  Article({
    required this.title,
    required this.content,
    required this.url,
    required this.imageUrl,
    this.videoUrl,
    required this.source,
    required this.publishedDate,
  });

  // Function to validate image URL, fallback to source icon if needed
  static String _validateImageUrl(dynamic url, dynamic sourceIcon) {
    if (url == null || url.isEmpty) {
      if (sourceIcon != null && sourceIcon is String && sourceIcon.isNotEmpty) {
        return sourceIcon; // ✅ Use source logo as fallback
      }
      return ''; // No image available
    }
    return url;
  }

  // Function to parse date safely
  static DateTime _parseDate(String? dateStr) {
    try {
      return DateTime.parse(dateStr ?? '');
    } catch (e) {
      return DateTime.now();
    }
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      content: json['description'] ?? 'No Description',
      url: json['link'] ?? '',
      imageUrl: _validateImageUrl(
        json['image_url'],
        json['source_icon'],
      ), // ✅ Fallback to source_icon
      videoUrl: json['video_url'],
      source: json['source_name'] ?? 'Unknown',
      publishedDate: _parseDate(json['pubDate']),
    );
  }
}
