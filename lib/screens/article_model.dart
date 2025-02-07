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
      imageUrl: _getImageUrl(json),
      videoUrl: json['video_url'] ?? null,
      source: json['source'] ?? 'Unknown',
      publishedDate: _parseDate(json['published_at']),
    );
  }

  // Ensure the image URL is valid or use a local asset
  static String _getImageUrl(Map<String, dynamic> json) {
    if (json['image'] != null && json['image'].isNotEmpty) {
      return json['image'];
    }
    return 'assets/images/pic1.png'; // Use local placeholder
  }

  static String _parseDate(dynamic date) {
    if (date == null || date is! String) return 'No Date';
    return date;
  }
}
