import 'package:afro_caribbean/screens/article_screen.dart';
import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'news_service.dart';
import 'article_model.dart';
// ignore: unused_import
import 'package:afro_caribbean/main.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = '';
  String selectedCategory = 'general'; // Default category
  late Future<List<Article>> articlesFuture;

  @override
  void initState() {
    super.initState();
    articlesFuture = NewsService.fetchArticles(
        country: selectedCountry, category: selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      body: Column(
        children: [
          // Country Dropdown
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Country'),
              value: selectedCountry.isEmpty ? null : selectedCountry,
              items: const [
                DropdownMenuItem(value: '', child: Text('All Countries')),
                DropdownMenuItem(value: 'us', child: Text('United States')),
                DropdownMenuItem(value: 'ng', child: Text('Nigeria')),
                DropdownMenuItem(value: 'gb', child: Text('United Kingdom')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCountry = value ?? '';
                  articlesFuture = NewsService.fetchArticles(
                      country: selectedCountry, category: selectedCategory);
                });
              },
            ),
          ),
          // Category Dropdown
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Select Category'),
              value: selectedCategory,
              items: const [
                DropdownMenuItem(value: 'general', child: Text('General')),
                DropdownMenuItem(value: 'business', child: Text('Business')),
                DropdownMenuItem(value: 'sports', child: Text('Sports')),
                DropdownMenuItem(
                    value: 'technology', child: Text('Technology')),
                DropdownMenuItem(value: 'health', child: Text('Health')),
                DropdownMenuItem(value: 'food', child: Text('Food')),
                DropdownMenuItem(value: 'travel', child: Text('Travel')),
                DropdownMenuItem(value: 'politics', child: Text('Politics')),
                DropdownMenuItem(
                    value: 'entertainment', child: Text('Entertainment')),
                DropdownMenuItem(value: 'science', child: Text('Science')),
                DropdownMenuItem(value: 'world', child: Text('World News')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCategory = value ?? 'general';
                  articlesFuture = NewsService.fetchArticles(
                      country: selectedCountry, category: selectedCategory);
                });
              },
            ),
          ),
          // Articles List
          Expanded(
            child: FutureBuilder<List<Article>>(
              future: articlesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No articles found.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final article = snapshot.data![index];
                      return ListTile(
                        title: Text(article.title),
                        subtitle: Text(article.author),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleScreen
                                .routeName, // Use the correct route name
                            arguments: article, // Pass article data
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
