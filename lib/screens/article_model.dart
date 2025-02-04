// class Article {
//   final String title;
//   final String author;
//   final String imageUrl;
//   final DateTime createdAt;
//   final String content;
//   final String category; // Added for categorization, if required.

//   Article({
//     required this.title,
//     required this.author,
//     required this.imageUrl,
//     required this.createdAt,
//     required this.content,
//     required this.category, // Make sure to initialize category as well
//   });

//   factory Article.fromMap(Map<String, dynamic> map) {
//     return Article(
//       title: map['title'] ?? 'No Title',
//       author: map['author'] ?? 'Unknown Author',
//       imageUrl: map['urlToImage'] ?? '',
//       createdAt: DateTime.tryParse(map['publishedAt'] ?? '') ?? DateTime.now(),
//       content: map['content'] ?? map['description'] ?? 'No content available.',
//       category: map['category'] ??
//           'General', // Assuming API might have a category field, otherwise default
//     );
//   }
// }
class Article {
  final String title;
  final String author;
  final String imageUrl;
  final DateTime createdAt;
  final String content;
  final String category;

  Article({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.createdAt,
    required this.content,
    required this.category,
  });

  // Convert JSON to Article object
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      author: json['author'] ?? 'Unknown Author',
      imageUrl: json['urlToImage'] ?? 'https://via.placeholder.com/300',
      createdAt: json['publishedAt'] != null
          ? DateTime.tryParse(json['publishedAt']) ?? DateTime.now()
          : DateTime.now(),
      content:
          json['content'] ?? json['description'] ?? 'No content available.',
      category: json['category'] ?? 'General', // Default if category is missing
    );
  }
}
