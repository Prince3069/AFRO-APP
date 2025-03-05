import 'package:afro_caribbean/screens/article_screen.dart';
import 'package:afro_caribbean/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'news_service.dart';
import 'article_model.dart';
// import 'article_screen.dart' as article_page; // Use alias 'article_page'

class CategoryScreen extends StatelessWidget {
  final String category;
  final String country;
  // final String selectedCountry
  const CategoryScreen({
    super.key,
    required this.category,
    required this.country,
    required String selectedCountry,
  });

  @override
  Widget build(BuildContext context) {
    String selectedCountry =
        country.isNotEmpty ? country : 'jm'; // Default to Jamaica

    return Scaffold(
      appBar: AppBar(
        title: Text(category.capitalize()),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: FutureBuilder<List<Article>>(
        future: NewsService.fetchArticles(
          country: selectedCountry, // Uses selected country
          category: category,
          query: '',
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading articles!',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No articles available.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          final articles = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ArticleScreen(article: article),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            article.imageUrl.isNotEmpty
                                ? article.imageUrl
                                : 'https://via.placeholder.com/120',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/placeholder.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  article.source,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  article.content.length > 100
                                      ? '${article.content.substring(0, 100)}...'
                                      : article.content,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
