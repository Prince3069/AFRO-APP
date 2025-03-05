import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'news_service.dart';
import 'article_model.dart';

class DiscoverScreen extends StatefulWidget {
  static const String routeName = '/discover';
  final String selectedCountryCode;

  const DiscoverScreen({super.key, required this.selectedCountryCode});

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<Article>> trendingArticles;
  late String currentCountry;

  final List<String> categories = [
    'business',
    'entertainment',
    'health',
    'politics',
    'science',
    'sports',
    'technology',
    'world',
  ];

  final Map<String, String> countryMap = {
    'us': 'United States',
    'ai': 'Anguilla',
    'ag': 'Antigua and Barbuda',
    'aw': 'Aruba',
    'bs': 'The Bahamas',
    'bb': 'Barbados',
    'vg': 'British Virgin Islands',
    'ky': 'Cayman Islands',
    'cu': 'Cuba',
    'dm': 'Dominica',
    'do': 'Dominican Republic',
    'gd': 'Grenada',
    'gp': 'Guadeloupe',
    'ht': 'Haiti',
    'jm': 'Jamaica',
    'mq': 'Martinique',
    'an': 'Netherlands Antilles',
    'pr': 'Puerto Rico',
    'bl': 'St Barts',
    'kn': 'St Kitts and Nevis',
    'lc': 'St Lucia',
    'mf': 'St Martin',
    'vc': 'St Vincent',
    'tt': 'Trinidad and Tobago',
    'tc': 'Turks and Caicos',

    'ng': 'Nigeria',
    'za': 'South Africa',
    'eg': 'Egypt',
    'dz': 'Algeria',
    'ma': 'Morocco',
    'et': 'Ethiopia',
    'ke': 'Kenya',
    'ao': 'Angola',
    'gh': 'Ghana',
    'tz': 'Tanzania',
    'ci': 'Ivory Coast',
    'cd': 'Democratic Republic of the Congo',
    'sd': 'Sudan',
    'sn': 'Senegal',
    'ly': 'Libya',
  };

  @override
  void initState() {
    super.initState();
    currentCountry =
        countryMap.containsKey(widget.selectedCountryCode)
            ? widget.selectedCountryCode
            : 'us';
    _fetchTrendingArticles();
  }

  void _fetchTrendingArticles() {
    setState(() {
      trendingArticles = NewsService.fetchArticles(
        country: currentCountry,
        category: 'top',
        query: '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Country Dropdown
            DropdownButton<String>(
              value: currentCountry,
              isExpanded: true,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    currentCountry = newValue;
                  });
                  _fetchTrendingArticles();
                }
              },
              items:
                  countryMap.keys.map<DropdownMenuItem<String>>((
                    String countryCode,
                  ) {
                    return DropdownMenuItem<String>(
                      value: countryCode,
                      child: Text(countryMap[countryCode]!),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'Categories',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _CategoryTile(
                    title: categories[index],
                    category: categories[index],
                    country: currentCountry,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Trending',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            FutureBuilder<List<Article>>(
              future: trendingArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Failed to load news. Try again later.'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No articles found for this country.'),
                  );
                }

                // Remove duplicate articles based on title
                final uniqueArticles =
                    snapshot.data!
                        .fold<Map<String, Article>>({}, (map, article) {
                          map[article.title] =
                              article; // Only keeps the last occurrence
                          return map;
                        })
                        .values
                        .toList();

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: uniqueArticles.length,
                  itemBuilder: (context, index) {
                    return _TrendingArticleCard(article: uniqueArticles[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String title;
  final String category;
  final String country;

  const _CategoryTile({
    required this.title,
    required this.category,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CategoryScreen(
                    category: category,
                    country: country,
                    selectedCountry: country,
                  ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _TrendingArticleCard extends StatelessWidget {
  final Article article;

  const _TrendingArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/article', arguments: article);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(12),
              ),
              child: Image.network(
                article.imageUrl,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    width: 120,
                    color: Colors.grey,
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
