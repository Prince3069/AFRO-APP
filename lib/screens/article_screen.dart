// ignore_for_file: deprecated_member_use

import 'package:afro_caribbean/screens/article_model.dart';
import 'package:afro_caribbean/widgets/image_container.dart';
import 'package:flutter/material.dart';
// import '../models/article_model.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;
  static const routeName = '/article';

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        title: const Text('Article', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🖼️ Image with Gradient Overlay
            Stack(
              children: [
                ImageContainer(
                  height: 300,
                  width: double.infinity,
                  imageUrl:
                      article.imageUrl.isNotEmpty
                          ? article.imageUrl
                          : 'assets/images/placeholder.png',
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black38,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 📰 Article Source
            Text(
              'Source: ${article.source}',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey[800],
              ),
            ),
            const Divider(thickness: 1, height: 20),

            // 📖 Article Content
            Text(
              article.content,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 20),

            // 📢 Share Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement Share Functionality (if needed)
                },
                icon: const Icon(Icons.share, color: Colors.white),
                label: const Text(
                  'Share',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
