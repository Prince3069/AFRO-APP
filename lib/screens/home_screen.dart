// import 'package:afro_caribbean/screens/article_screen.dart';
// import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'news_service.dart';
// import 'article_model.dart';
// // ignore: unused_import
// import 'package:afro_caribbean/main.dart';

// // ignore: use_key_in_widget_constructors
// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';
//   @override
//   // ignore: library_private_types_in_public_api
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedCountry = '';
//   String selectedCategory = 'general'; // Default category
//   late Future<List<Article>> articlesFuture;

//   @override
//   void initState() {
//     super.initState();
//     articlesFuture = NewsService.fetchArticles(
//         country: selectedCountry, category: selectedCategory);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.menu, color: Colors.black),
//           onPressed: () {},
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBar(index: 0),
//       body: Column(
//         children: [
//           // Country Dropdown
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Select Country'),
//               value: selectedCountry.isEmpty ? null : selectedCountry,
//               items: const [
//                 DropdownMenuItem(value: '', child: Text('All Countries')),
//                 DropdownMenuItem(value: 'us', child: Text('United States')),
//                 DropdownMenuItem(value: 'ng', child: Text('Nigeria')),
//                 DropdownMenuItem(value: 'gb', child: Text('United Kingdom')),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   selectedCountry = value ?? '';
//                   articlesFuture = NewsService.fetchArticles(
//                       country: selectedCountry, category: selectedCategory);
//                 });
//               },
//             ),
//           ),
//           // Category Dropdown
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Select Category'),
//               value: selectedCategory,
//               items: const [
//                 DropdownMenuItem(value: 'general', child: Text('General')),
//                 DropdownMenuItem(value: 'business', child: Text('Business')),
//                 DropdownMenuItem(value: 'sports', child: Text('Sports')),
//                 DropdownMenuItem(
//                     value: 'technology', child: Text('Technology')),
//                 DropdownMenuItem(value: 'health', child: Text('Health')),
//                 DropdownMenuItem(value: 'food', child: Text('Food')),
//                 DropdownMenuItem(value: 'travel', child: Text('Travel')),
//                 DropdownMenuItem(value: 'politics', child: Text('Politics')),
//                 DropdownMenuItem(
//                     value: 'entertainment', child: Text('Entertainment')),
//                 DropdownMenuItem(value: 'science', child: Text('Science')),
//                 DropdownMenuItem(value: 'world', child: Text('World News')),
//               ],
//               onChanged: (value) {
//                 setState(() {
//                   selectedCategory = value ?? 'general';
//                   articlesFuture = NewsService.fetchArticles(
//                       country: selectedCountry, category: selectedCategory);
//                 });
//               },
//             ),
//           ),
//           // Articles List
//           Expanded(
//             child: FutureBuilder<List<Article>>(
//               future: articlesFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No articles found.'));
//                 } else {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final article = snapshot.data![index];
//                       return ListTile(
//                         title: Text(article.title),
//                         subtitle: Text(article.author),
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             ArticleScreen
//                                 .routeName, // Use the correct route name
//                             arguments: article, // Pass article data
//                           );
//                         },
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:afro_caribbean/screens/article_screen.dart';
// import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
// import 'package:afro_caribbean/widgets/image_container.dart';
// import 'package:flutter/material.dart';
// import 'news_service.dart';
// import 'article_model.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedCountry = '';
//   String selectedCategory = 'general';
//   late Future<List<Article>> articlesFuture;

//   @override
//   void initState() {
//     super.initState();
//     articlesFuture = NewsService.fetchArticles(
//         country: selectedCountry, category: selectedCategory);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Latest News', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       bottomNavigationBar: const BottomNavBar(index: 0),
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(labelText: 'Country'),
//                     value: selectedCountry.isEmpty ? null : selectedCountry,
//                     items: const [
//                       DropdownMenuItem(value: '', child: Text('All')),
//                       DropdownMenuItem(value: 'us', child: Text('USA')),
//                       DropdownMenuItem(value: 'ng', child: Text('Nigeria')),
//                       DropdownMenuItem(value: 'gb', child: Text('UK')),
//                     ],
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCountry = value ?? '';
//                         articlesFuture = NewsService.fetchArticles(
//                             country: selectedCountry,
//                             category: selectedCategory);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(labelText: 'Category'),
//                     value: selectedCategory,
//                     items: const [
//                       DropdownMenuItem(
//                           value: 'general', child: Text('General')),
//                       DropdownMenuItem(
//                           value: 'business', child: Text('Business')),
//                       DropdownMenuItem(value: 'sports', child: Text('Sports')),
//                       DropdownMenuItem(
//                           value: 'technology', child: Text('Tech')),
//                       DropdownMenuItem(value: 'health', child: Text('Health')),
//                     ],
//                     onChanged: (value) {
//                       setState(() {
//                         selectedCategory = value ?? 'general';
//                         articlesFuture = NewsService.fetchArticles(
//                             country: selectedCountry,
//                             category: selectedCategory);
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder<List<Article>>(
//               future: articlesFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(child: Text('No articles found.'));
//                 } else {
//                   return ListView.builder(
//                     padding: const EdgeInsets.all(16.0),
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final article = snapshot.data![index];
//                       return Card(
//                         margin: const EdgeInsets.only(bottom: 16.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               ArticleScreen.routeName,
//                               arguments: article,
//                             );
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               if (article.imageUrl.isNotEmpty)
//                                 ClipRRect(
//                                   borderRadius: const BorderRadius.vertical(
//                                       top: Radius.circular(12.0)),
//                                   child: Image.network(
//                                     article.imageUrl,
//                                     height: 180,
//                                     width: double.infinity,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               Padding(
//                                 padding: const EdgeInsets.all(12.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       article.title,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleMedium!
//                                           .copyWith(
//                                               fontWeight: FontWeight.bold),
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     const SizedBox(height: 4),
//                                     Text(
//                                       article.author,
//                                       style:
//                                           Theme.of(context).textTheme.bodySmall,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:afro_caribbean/screens/article_screen.dart';
// import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'news_service.dart';
// import 'article_model.dart';

// class HomeScreen extends StatefulWidget {
//   static const String routeName = '/home';

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedCountry = '';
//   String selectedCategory = 'general';
//   late Future<List<Article>> articlesFuture;

//   @override
//   void initState() {
//     super.initState();
//     articlesFuture = NewsService.fetchArticles(
//         country: selectedCountry, category: selectedCategory);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           'Afro Caribbean News',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.blueGrey[900],
//       bottomNavigationBar: const BottomNavBar(index: 0),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder<List<Article>>(
//                 future: articlesFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return const Center(child: Text('No articles found.'));
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final article = snapshot.data![index];
//                         return Card(
//                           color: Colors.blueGrey[800],
//                           margin: const EdgeInsets.all(10),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(12)),
//                                 child: Image.network(
//                                   article.imageUrl,
//                                   height: 200,
//                                   width: double.infinity,
//                                   fit: BoxFit.cover,
//                                   errorBuilder: (context, error, stackTrace) {
//                                     return Image.asset(
//                                         'assets/images/placeholder.png',
//                                         height: 200,
//                                         width: double.infinity,
//                                         fit: BoxFit.cover);
//                                   },
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text(
//                                   article.title,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0, vertical: 4.0),
//                                 child: Text(
//                                   article.author,
//                                   style: TextStyle(color: Colors.grey[300]),
//                                 ),
//                               ),
//                             ],
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
import 'package:afro_caribbean/screens/article_screen.dart';
import 'package:afro_caribbean/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'news_service.dart';
import 'article_model.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = '';
  String selectedCategory = 'history'; // Default category
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
      print(
          'Fetching data for: Country = $selectedCountry, Category = $selectedCategory'); // Debugging
      articlesFuture = NewsService.fetchArticles(
        country: countryCodes[selectedCountry] ?? '',
        category: selectedCategory,
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
      backgroundColor: Colors.blueGrey[900],
      bottomNavigationBar: const BottomNavBar(index: 0),
      body: SafeArea(
        child: Column(
          children: [
            // Dropdowns for Filtering
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
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    dropdownColor: Colors.blueGrey[800],
                    value: selectedCountry.isEmpty
                        ? 'All Countries'
                        : selectedCountry,
                    items: countryCodes.keys.map((String country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country,
                            style: const TextStyle(color: Colors.white)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value ?? 'All Countries';
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
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    dropdownColor: Colors.blueGrey[800],
                    value: selectedCategory,
                    items: const [
                      DropdownMenuItem(
                          value: 'history', child: Text('History & Culture')),
                      DropdownMenuItem(
                          value: 'technology', child: Text('Technology')),
                      DropdownMenuItem(
                          value: 'tourism', child: Text('Tourism')),
                      DropdownMenuItem(
                          value: 'current_affairs',
                          child: Text('Current Affairs')),
                      DropdownMenuItem(
                          value: 'entertainment', child: Text('Entertainment')),
                      DropdownMenuItem(value: 'sports', child: Text('Sports')),
                      DropdownMenuItem(
                          value: 'education', child: Text('Education')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value ?? 'history';
                        _fetchArticles();
                      });
                    },
                  ),
                ],
              ),
            ),

            // News Articles List
            Expanded(
              child: FutureBuilder<List<Article>>(
                future: articlesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text('Error: ${snapshot.error}',
                            style: TextStyle(color: Colors.red)));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text(
                        'No articles found.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final article = snapshot.data![index];
                        return Card(
                          color: Colors.blueGrey[800],
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(12)),
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
                                        fit: BoxFit.cover);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  article.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: Text(
                                  article.author,
                                  style: TextStyle(color: Colors.grey[300]),
                                ),
                              ),
                            ],
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
