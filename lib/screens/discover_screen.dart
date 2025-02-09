// import 'package:afro_caribbean/utils/string_extension.dart';
// import 'package:flutter/material.dart';
// import 'package:afro_caribbean/widgets/image_container.dart';
// import 'news_service.dart';
// import 'article_model.dart';

// class DiscoverScreen extends StatefulWidget {
//   static const String routeName = '/discover';
//   const DiscoverScreen({Key? key, required this.selectedCountry})
//       : super(key: key);

//   final String selectedCountry;

//   @override
//   _DiscoverScreenState createState() => _DiscoverScreenState();
// }

// class _DiscoverScreenState extends State<DiscoverScreen> {
//   late Future<List<Article>> trendingArticles;
//   late List<String> categories;

//   @override
//   void initState() {
//     super.initState();
//     categories = [
//       'business',
//       'entertainment',
//       'health',
//       'politics',
//       'science',
//       'sports',
//       'technology',
//       'top',
//       'world',
//     ];
//     _fetchTrendingArticles();
//   }

//   void _fetchTrendingArticles() {
//     trendingArticles = NewsService.fetchArticles(
//       country: widget.selectedCountry,
//       category: 'top',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.blueGrey[900],
//         elevation: 0,
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.grey[100],
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔍 Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search news...',
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               onSubmitted: (query) {
//                 // Implement search logic here
//               },
//             ),
//             const SizedBox(height: 24),

//             // 🗂️ Categories Section
//             Text(
//               'Categories',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 120,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: List.generate(categories.length, (index) {
//                   return _CategoryTile(
//                     title: categories[index].capitalize(),
//                     category: categories[index],
//                   );
//                 }),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // 🔥 Trending Section
//             Text(
//               'Trending',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             FutureBuilder<List<Article>>(
//               future: trendingArticles,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No articles found.'));
//                 } else {
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final article = snapshot.data![index];
//                       return _TrendingArticleCard(article: article);
//                     },
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 📰 Improved Card UI for Articles
// class _TrendingArticleCard extends StatelessWidget {
//   final Article article;
//   const _TrendingArticleCard({Key? key, required this.article})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, '/article', arguments: article);
//         },
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.horizontal(
//                 left: Radius.circular(12),
//               ),
//               child: ImageContainer(
//                 height: 120,
//                 width: 120,
//                 imageUrl: article.imageUrl,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       article.title,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleMedium!
//                           .copyWith(fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Source: ${article.source}',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[700],
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // 🗂️ Category Tiles
// class _CategoryTile extends StatelessWidget {
//   final String title;
//   final String category;
//   const _CategoryTile({Key? key, required this.title, required this.category})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.grey.shade200,
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, '/category', arguments: category);
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(_getCategoryIcon(category), size: 48, color: Colors.blue),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   IconData _getCategoryIcon(String category) {
//     switch (category) {
//       case 'sports':
//         return Icons.sports;
//       case 'health':
//         return Icons.health_and_safety;
//       case 'technology':
//         return Icons.computer;
//       case 'politics':
//         return Icons.account_balance;
//       case 'entertainment':
//         return Icons.movie;
//       case 'science':
//         return Icons.science;
//       case 'business':
//         return Icons.business;
//       case 'world':
//         return Icons.public;
//       default:
//         return Icons.category;
//     }
//   }
// }
import 'package:afro_caribbean/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:afro_caribbean/widgets/image_container.dart';
import 'news_service.dart';
import 'article_model.dart';

class DiscoverScreen extends StatefulWidget {
  static const String routeName = '/discover';
  const DiscoverScreen({Key? key, required this.selectedCountry})
      : super(key: key);

  final String selectedCountry;

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<Article>> trendingArticles;
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = [
      'business',
      'entertainment',
      'health',
      'politics',
      'science',
      'sports',
      'technology',
      'top',
      'world',
    ];
    _fetchTrendingArticles();
  }

  void _fetchTrendingArticles() {
    trendingArticles = NewsService.fetchArticles(
      country: widget.selectedCountry,
      category: 'top',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search news...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (query) {
                // Implement search logic here
              },
            ),
            const SizedBox(height: 24),

            // 🗂️ Categories Section
            Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(categories.length, (index) {
                  return _CategoryTile(
                    title: categories[index].capitalize(),
                    category: categories[index],
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),

            // 🔥 Trending Section
            Text(
              'Trending',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<Article>>(
              future: trendingArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No articles found.'));
                } else {
                  // Filter out articles without valid images
                  final validArticles = snapshot.data!.where((article) {
                    return article.imageUrl.isNotEmpty &&
                        article.imageUrl.toLowerCase() != "n/a";
                  }).toList();

                  if (validArticles.isEmpty) {
                    return const Center(
                        child: Text('No articles with images.'));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: validArticles.length,
                    itemBuilder: (context, index) {
                      final article = validArticles[index];
                      return _TrendingArticleCard(article: article);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// 📰 Improved Card UI for Articles
class _TrendingArticleCard extends StatelessWidget {
  final Article article;
  const _TrendingArticleCard({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
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
              child: ImageContainer(
                height: 120,
                width: 120,
                imageUrl: article.imageUrl,
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
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Source: ${article.source}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
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

// 🗂️ Category Tiles
class _CategoryTile extends StatelessWidget {
  final String title;
  final String category;
  const _CategoryTile({Key? key, required this.title, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/category', arguments: category);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getCategoryIcon(category), size: 48, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'sports':
        return Icons.sports;
      case 'health':
        return Icons.health_and_safety;
      case 'technology':
        return Icons.computer;
      case 'politics':
        return Icons.account_balance;
      case 'entertainment':
        return Icons.movie;
      case 'science':
        return Icons.science;
      case 'business':
        return Icons.business;
      case 'world':
        return Icons.public;
      default:
        return Icons.category;
    }
  }
}
