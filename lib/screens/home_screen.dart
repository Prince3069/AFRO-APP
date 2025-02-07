import 'package:afro_caribbean/screens/article_screen.dart';
import 'package:afro_caribbean/screens/article_model.dart';
import 'package:afro_caribbean/screens/news_service.dart';
import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = 'Jamaica'; // Default country
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
  };

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    setState(() {
      articlesFuture = NewsService.fetchArticles(
        country: countryCodes[selectedCountry] ?? '',
        category: selectedCategory,
        query: '',
      );
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
      bottomNavigationBar: const BottomNavBar(index: 0),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // Country Dropdown
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
                    items: countryCodes.keys.map((String country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value ?? 'Jamaica';
                        _fetchArticles();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  // Category Dropdown
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
                          value: 'politics', child: Text('Politics')),
                      DropdownMenuItem(
                          value: 'business', child: Text('Business')),
                      DropdownMenuItem(
                          value: 'technology', child: Text('Technology')),
                      DropdownMenuItem(
                          value: 'entertainment', child: Text('Entertainment')),
                      DropdownMenuItem(value: 'sports', child: Text('Sports')),
                      DropdownMenuItem(
                          value: 'science', child: Text('Science')),
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
            Expanded(
              child: FutureBuilder<List<Article>>(
                future: articlesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No articles found.'));
                  }

                  List<Article> articles = snapshot.data!;

                  return ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      Article article = articles[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ArticleScreen.routeName,
                            arguments: article,
                          );
                        },
                        child: Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Article Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  article.imageUrl,
                                  width: 120,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/pic1.png',
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Article Details
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                      );
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
