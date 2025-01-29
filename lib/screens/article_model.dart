// // import 'article_screen.dart';
// // Refactored article_model.dart
// class Article {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final DateTime createdAt;
//   final String content;

//   Article({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.createdAt,
//     required this.content,
//   });

//   factory Article.fromMap(Map<String, dynamic> map) {
//     return Article(
//       title: map['title'] ?? 'No Title',
//       author: map['author'] ?? 'Unknown Author',
//       imageUrl: map['urlToImage'] ?? '',
//       createdAt: DateTime.tryParse(map['publishedAt'] ?? '') ?? DateTime.now(),
//       content: map['content'] ?? map['description'] ?? 'No content available.',
//     );
//   }

//   // String? get category => null;
// }
class Article {
  final String title;
  final String author;
  final String imageUrl;
  final DateTime createdAt;
  final String content;
  final String category; // Added for categorization, if required.

  Article({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.createdAt,
    required this.content,
    required this.category, // Make sure to initialize category as well
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? 'No Title',
      author: map['author'] ?? 'Unknown Author',
      imageUrl: map['urlToImage'] ?? '',
      createdAt: DateTime.tryParse(map['publishedAt'] ?? '') ?? DateTime.now(),
      content: map['content'] ?? map['description'] ?? 'No content available.',
      category: map['category'] ??
          'General', // Assuming API might have a category field, otherwise default
    );
  }
}
