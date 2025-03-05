// ignore_for_file: use_super_parameters, unused_import, library_private_types_in_public_api

import 'package:afro_caribbean/screens/article_model.dart';
import 'package:afro_caribbean/screens/article_screen.dart';
import 'package:afro_caribbean/screens/news_service.dart';
import 'package:afro_caribbean/widgets/articleTile.dart';
import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = 'Nigeria'; // Default country is Nigeria
  String selectedCategory = 'top'; // Default category
  late Future<List<Article>> articlesFuture;

  final Map<String, String> countryCodes = {
    'All Countries': '',
    'Anguilla': 'ai',
    'Antigua and Barbuda': 'ag',
    'Aruba': 'aw',
    'The Bahamas': 'bs',
    'Barbados': 'bb',
    'British Virgin Islands': 'vg',
    'Cayman Islands': 'ky',
    'Cuba': 'cu',
    'Dominica': 'dm',
    'Dominican Republic': 'do',
    'Grenada': 'gd',
    'Guadeloupe': 'gp',
    'Haiti': 'ht',
    'Jamaica': 'jm',
    'Martinique': 'mq',
    'Netherlands Antilles': 'an',
    'Puerto Rico': 'pr',
    'St Barts': 'bl',
    'St Kitts and Nevis': 'kn',
    'St Lucia': 'lc',
    'St Martin': 'mf',
    'St Vincent': 'vc',
    'Trinidad and Tobago': 'tt',
    'Turks and Caicos': 'tc',
    'United States': 'us',
    'Nigeria': 'ng',
    'South Africa': 'za',
    'Egypt': 'eg',
    'Algeria': 'dz',
    'Morocco': 'ma',
    'Ethiopia': 'et',
    'Kenya': 'ke',
    'Angola': 'ao',
    'Ghana': 'gh',
    'Tanzania': 'tz',
    'Ivory Coast': 'ci',
    'Democratic Republic of the Congo': 'cd',
    'Sudan': 'sd',
    'Senegal': 'sn',
    'Libya': 'ly',
  };

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    setState(() {
      String countryCode =
          countryCodes[selectedCountry] ?? 'ng'; // Default to Nigeria if empty
      articlesFuture = NewsService.fetchArticles(
        country: countryCode,
        category: selectedCategory,
        query: '',
      ).then((articles) {
        // Remove articles with missing images
        articles =
            articles.where((article) {
              return article.imageUrl.isNotEmpty &&
                  article.imageUrl != 'assets/images/pic1.png';
            }).toList();

        // Remove duplicate articles based on title
        final uniqueTitles = <String>{};
        articles =
            articles
                .where((article) => uniqueTitles.add(article.title))
                .toList();

        return articles;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        title: const Text(
          'Afro Caribbean News',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavBar(
        index: 0,
        selectedCountry: countryCodes[selectedCountry] ?? 'ng',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Country',
                      filled: true,
                      fillColor: Colors.blueGrey[800],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    dropdownColor: Colors.blueGrey[800],
                    value: selectedCountry,
                    items:
                        countryCodes.keys.map((String country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(
                              country,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry =
                            value ?? 'Nigeria'; // Default to Nigeria if null
                        _fetchArticles();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Select Category',
                      filled: true,
                      fillColor: Colors.blueGrey[800],
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    dropdownColor: Colors.blueGrey[800],
                    value: selectedCategory,
                    items: const [
                      DropdownMenuItem(value: 'top', child: Text('Top News')),
                      DropdownMenuItem(value: 'world', child: Text('World')),
                      DropdownMenuItem(
                        value: 'politics',
                        child: Text('Politics'),
                      ),
                      DropdownMenuItem(
                        value: 'business',
                        child: Text('Business'),
                      ),
                      DropdownMenuItem(
                        value: 'technology',
                        child: Text('Technology'),
                      ),
                      DropdownMenuItem(
                        value: 'entertainment',
                        child: Text('Entertainment'),
                      ),
                      DropdownMenuItem(value: 'sports', child: Text('Sports')),
                      DropdownMenuItem(
                        value: 'science',
                        child: Text('Science'),
                      ),
                      DropdownMenuItem(value: 'health', child: Text('Health')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value ?? 'top';
                        _fetchArticles();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
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
                  }

                  final articles = snapshot.data!;
                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return ArticleTile(article: article);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ArticleScreen when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(article: article),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                article.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/placeholder.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    article.source,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    article.publishedDate.toIso8601String(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
