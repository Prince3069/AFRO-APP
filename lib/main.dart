import 'package:afro_caribbean/screens/discover_screen.dart';
import 'package:afro_caribbean/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/article_screen.dart'; // Import your ArticleScreen

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afro Caribbean News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Add routes here
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(), // HomeScreen route
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        // ArticleScreen route
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
