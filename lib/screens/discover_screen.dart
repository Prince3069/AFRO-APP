// // ignore: unused_import
// import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
// import 'package:afro_caribbean/widgets/image_container.dart';
// import 'package:flutter/material.dart';
// import 'news_service.dart';
// import 'article_model.dart';

// class DiscoverScreen extends StatefulWidget {
//   static const String routeName = '/discover';
//   const DiscoverScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _DiscoverScreenState createState() => _DiscoverScreenState();
// }

// class _DiscoverScreenState extends State<DiscoverScreen> {
//   late Future<List<Article>> trendingArticles;

//   @override
//   void initState() {
//     super.initState();
//     trendingArticles = NewsService.fetchArticles(
//         country: '', category: 'general'); // Default category
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
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
//             Text(
//               'Categories',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Wrap GridView inside Expanded to avoid overflow
//             Expanded(
//               flex: 2,
//               child: GridView(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16.0,
//                   crossAxisSpacing: 16.0,
//                 ),
//                 children: const [
//                   _CategoryTile(
//                       title: 'Food', icon: Icons.fastfood, category: 'food'),
//                   _CategoryTile(
//                       title: 'Sports', icon: Icons.sports, category: 'sports'),
//                   _CategoryTile(
//                       title: 'Health',
//                       icon: Icons.health_and_safety,
//                       category: 'health'),
//                   _CategoryTile(
//                       title: 'Technology',
//                       icon: Icons.computer,
//                       category: 'technology'),
//                   _CategoryTile(
//                       title: 'Travel',
//                       icon: Icons.travel_explore,
//                       category: 'travel'),
//                   _CategoryTile(
//                       title: 'Politics',
//                       icon: Icons.account_balance,
//                       category: 'politics'),
//                   _CategoryTile(
//                       title: 'Entertainment',
//                       icon: Icons.movie,
//                       category: 'entertainment'),
//                   _CategoryTile(
//                       title: 'Science',
//                       icon: Icons.science,
//                       category: 'science'),
//                   _CategoryTile(
//                       title: 'Business',
//                       icon: Icons.business,
//                       category: 'business'),
//                   _CategoryTile(
//                       title: 'World News',
//                       icon: Icons.public,
//                       category: 'world'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               'Trending',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Wrap ListView.builder inside Expanded to avoid overflow
//             Expanded(
//               flex: 3,
//               child: FutureBuilder<List<Article>>(
//                 future: trendingArticles,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No trending news.'));
//                   } else {
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final article = snapshot.data![index];
//                         return InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/article',
//                               arguments: article,
//                             );
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             margin: const EdgeInsets.only(right: 16.0),
//                             child: ListView(
//                               // crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ImageContainer(
//                                     height: 150,
//                                     width: 100,
//                                     imageUrl: article.imageUrl),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   article.title,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '${DateTime.now().difference(article.createdAt).inHours} hours ago',
//                                   style: Theme.of(context).textTheme.bodySmall,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CategoryTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String category;

//   const _CategoryTile({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.category,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/category', // Define the correct route if needed
//           arguments: category,
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.grey.shade200,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 48, color: Colors.blue),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:afro_caribbean/widgets/image_container.dart';
// import 'package:flutter/material.dart';
// import 'news_service.dart';
// import 'article_model.dart';

// class DiscoverScreen extends StatefulWidget {
//   static const String routeName = '/discover';
//   const DiscoverScreen({Key? key}) : super(key: key);

//   @override
//   _DiscoverScreenState createState() => _DiscoverScreenState();
// }

// class _DiscoverScreenState extends State<DiscoverScreen> {
//   late Future<List<Article>> trendingArticles;

//   @override
//   void initState() {
//     super.initState();
//     trendingArticles = NewsService.fetchArticles(
//         country: '', category: 'general'); // Default category
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discover'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
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

//             /// Categories Section
//             Text(
//               'Categories',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 250, // Give a fixed height to GridView
//               child: GridView(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 16.0,
//                   crossAxisSpacing: 16.0,
//                 ),
//                 shrinkWrap: true,
//                 physics:
//                     const NeverScrollableScrollPhysics(), // Disable internal scroll
//                 children: const [
//                   _CategoryTile(
//                       title: 'Food', icon: Icons.fastfood, category: 'food'),
//                   _CategoryTile(
//                       title: 'Sports', icon: Icons.sports, category: 'sports'),
//                   _CategoryTile(
//                       title: 'Health',
//                       icon: Icons.health_and_safety,
//                       category: 'health'),
//                   _CategoryTile(
//                       title: 'Technology',
//                       icon: Icons.computer,
//                       category: 'technology'),
//                   _CategoryTile(
//                       title: 'Travel',
//                       icon: Icons.travel_explore,
//                       category: 'travel'),
//                   _CategoryTile(
//                       title: 'Politics',
//                       icon: Icons.account_balance,
//                       category: 'politics'),
//                   _CategoryTile(
//                       title: 'Entertainment',
//                       icon: Icons.movie,
//                       category: 'entertainment'),
//                   _CategoryTile(
//                       title: 'Science',
//                       icon: Icons.science,
//                       category: 'science'),
//                   _CategoryTile(
//                       title: 'Business',
//                       icon: Icons.business,
//                       category: 'business'),
//                   _CategoryTile(
//                       title: 'World News',
//                       icon: Icons.public,
//                       category: 'world'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),

//             /// Trending Section
//             Text(
//               'Trending',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 250, // Set height for horizontal ListView
//               child: FutureBuilder<List<Article>>(
//                 future: trendingArticles,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No trending news.'));
//                   } else {
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final article = snapshot.data![index];
//                         return InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/article',
//                               arguments: article,
//                             );
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             margin: const EdgeInsets.only(right: 16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ImageContainer(
//                                     height: 150,
//                                     width: 100,
//                                     imageUrl: article.imageUrl),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   article.title,
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   '${DateTime.now().difference(article.createdAt).inHours} hours ago',
//                                   style: Theme.of(context).textTheme.bodySmall,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CategoryTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final String category;

//   const _CategoryTile({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.category,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           '/category',
//           arguments: category,
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.grey.shade200,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 48, color: Colors.blue),
//             const SizedBox(height: 8),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:afro_caribbean/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'news_service.dart';
import 'article_model.dart';

class DiscoverScreen extends StatefulWidget {
  static const String routeName = '/discover';
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<Article>> trendingArticles;

  @override
  void initState() {
    super.initState();
    trendingArticles = NewsService.fetchArticles(
        country: '', category: 'general'); // Default category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            /// Categories Section (NOW SCROLLABLE 🎉)
            Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120, // Adjust height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryTile(
                      title: 'Food', icon: Icons.fastfood, category: 'food'),
                  _CategoryTile(
                      title: 'Sports', icon: Icons.sports, category: 'sports'),
                  _CategoryTile(
                      title: 'Health',
                      icon: Icons.health_and_safety,
                      category: 'health'),
                  _CategoryTile(
                      title: 'Technology',
                      icon: Icons.computer,
                      category: 'technology'),
                  _CategoryTile(
                      title: 'Travel',
                      icon: Icons.travel_explore,
                      category: 'travel'),
                  _CategoryTile(
                      title: 'Politics',
                      icon: Icons.account_balance,
                      category: 'politics'),
                  _CategoryTile(
                      title: 'Entertainment',
                      icon: Icons.movie,
                      category: 'entertainment'),
                  _CategoryTile(
                      title: 'Science',
                      icon: Icons.science,
                      category: 'science'),
                  _CategoryTile(
                      title: 'Business',
                      icon: Icons.business,
                      category: 'business'),
                  _CategoryTile(
                      title: 'World News',
                      icon: Icons.public,
                      category: 'world'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// Trending Section
            Text(
              'Trending',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250, // Set height for horizontal ListView
              child: FutureBuilder<List<Article>>(
                future: trendingArticles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No trending news.'));
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final article = snapshot.data![index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/article',
                              arguments: article,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ImageContainer(
                                    height: 150,
                                    width: 100,
                                    imageUrl: article.imageUrl),
                                const SizedBox(height: 8),
                                Text(
                                  article.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${DateTime.now().difference(article.createdAt).inHours} hours ago',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String category;

  const _CategoryTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Ensure fixed width for scrolling
      margin: const EdgeInsets.only(right: 12), // Add spacing between items
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.shade200,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/category',
            arguments: category,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
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
}
