import 'package:flutter/material.dart';
import 'package:afro_caribbean/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Afro Caribbean',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        FoodScreen.routeName: (context) => const FoodScreen(),
        ScienceScreen.routeName: (context) => const ScienceScreen(),
        SportScreen.routeName: (context) => const SportScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}
