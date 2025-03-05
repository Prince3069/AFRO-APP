// import 'package:afro_caribbean/screens/article_model.dart';
// import 'package:afro_caribbean/screens/category_screen.dart';
// import 'package:afro_caribbean/screens/discover_screen.dart';
// import 'package:afro_caribbean/screens/learn_screen.dart';
// import 'package:afro_caribbean/screens/profile_screen.dart';
// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'screens/article_screen.dart';
// // import 'models/article_model.dart'; // Ensure correct import

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
//       home: const HomeScreen(), // Use home instead of initialRoute
//       routes: {
//         LearnScreen.routeName: (context) => const LearnScreen(),
//         ArticleScreen.routeName: (context) {
//           final article = ModalRoute.of(context)!.settings.arguments as Article;
//           return ArticleScreen(article: article);
//         },
//         DiscoverScreen.routeName: (context) => const DiscoverScreen(
//               selectedCountry: '',
//             ),
//         '/category': (context) {
//           final category = ModalRoute.of(context)!.settings.arguments as String;
//           return CategoryScreen(category: category);
//         },
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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/article_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      // home: const HomeScreen(),
      initialRoute: '/home', // Use home instead of initialRoute
      routes: {
        '/home': (context) => HomeScreen(),
        LearnScreen.routeName: (context) => const LearnScreen(),
        ArticleScreen.routeName: (context) {
          final article = ModalRoute.of(context)!.settings.arguments as Article;
          return ArticleScreen(article: article);
        },
        DiscoverScreen.routeName:
            (context) => DiscoverScreen(selectedCountryCode: 'CountryCode'),
        '/category': (context) {
          final category = ModalRoute.of(context)!.settings.arguments as String;
          return CategoryScreen(
            category: category,
            country: '',
            selectedCountry: '',
          );
        },
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
