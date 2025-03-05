import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<dynamic> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        var article = articles[index];
        return ListTile(
          title: Text(article['title'] ?? 'No Title'),
          subtitle: Text(article['description'] ?? 'No Description'),
        );
      },
    );
  }
}
