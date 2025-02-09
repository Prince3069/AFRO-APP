// import 'package:afro_caribbean/screens/discover_screen.dart';
// import 'package:afro_caribbean/screens/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'screens/article_screen.dart'; // Import your ArticleScreen

// void main() {
//   runApp(MyApp());
// }

// // ignore: use_key_in_widget_constructors
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Afro Caribbean News',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       // Add routes here
//       initialRoute: '/',
//       routes: {
//         ArticleScreen.routeName: (context) => const ArticleScreen(),

//         '/home': (context) => HomeScreen(),
//         // ArticleScreen route
//         DiscoverScreen.routeName: (context) => const DiscoverScreen(),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//       },
//     );
//   }
// }
// import 'package:afro_caribbean/screens/category_screen.dart';
// import 'package:afro_caribbean/screens/discover_screen.dart';
// import 'package:afro_caribbean/screens/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'screens/article_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Afro Caribbean News',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomeScreen(), // Use home instead of initialRoute
//       routes: {
//         ArticleScreen.routeName: (context) => const ArticleScreen(),
//         DiscoverScreen.routeName: (context) => const DiscoverScreen(
//               selectedCountry: '',
//             ),
//         '/category': (context) => CategoryScreen(
//             category: ModalRoute.of(context)!.settings.arguments as String),
//         ProfileScreen.routeName: (context) => ProfileScreen(),
//       },
//     );
//   }
// }
import 'package:afro_caribbean/screens/article_model.dart';
import 'package:afro_caribbean/screens/category_screen.dart';
import 'package:afro_caribbean/screens/discover_screen.dart';
import 'package:afro_caribbean/screens/learn_screen.dart';
import 'package:afro_caribbean/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/article_screen.dart';
// import 'models/article_model.dart'; // Ensure correct import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afro Caribbean News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(), // Use home instead of initialRoute
      routes: {
        LearnScreen.routeName: (context) => const LearnScreen(),
        ArticleScreen.routeName: (context) {
          final article = ModalRoute.of(context)!.settings.arguments as Article;
          return ArticleScreen(article: article);
        },
        DiscoverScreen.routeName: (context) => const DiscoverScreen(
              selectedCountry: '',
            ),
        '/category': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return CategoryScreen(category: category);
        },
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
