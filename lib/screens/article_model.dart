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
//       videoUrl: json['video_url'] ?? null,
//       source: json['source'] ?? 'Unknown',
//       publishedDate: _parseDate(json['published_at']),
//     );
//   }

//   // Ensure the image URL is valid or use a local asset
//   static String _getImageUrl(Map<String, dynamic> json) {
//     if (json['image'] != null && json['image'].isNotEmpty) {
//       return json['image'];
//     }
//     return 'assets/images/pic1.png'; // Use local placeholder
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
  final String publishedDate;

  Article({
    required this.title,
    required this.content,
    required this.url,
    required this.imageUrl,
    this.videoUrl,
    required this.source,
    required this.publishedDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      content: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      imageUrl: _getImageUrl(json), // Updated image logic
      videoUrl: json['video_url'],
      source: json['source'] ?? 'Unknown',
      publishedDate: _parseDate(json['published_at']),
    );
  }

  // Ensure a valid image URL or use a placeholder
  static String _getImageUrl(Map<String, dynamic> json) {
    if (json['image_url'] != null && json['image_url'].isNotEmpty) {
      return json['image_url']; // Corrected API key
    }
    return 'https://via.placeholder.com/150'; // Online placeholder image
  }

  static String _parseDate(dynamic date) {
    if (date == null || date is! String) return 'No Date';
    return date;
  }
}
