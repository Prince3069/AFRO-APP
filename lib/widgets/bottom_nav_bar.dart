import 'package:afro_caribbean/screens/discover_screen.dart';
import 'package:afro_caribbean/screens/learn_screen.dart';
import 'package:flutter/material.dart';
import '../screens/screens.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final String selectedCountry; // ✅ Keep track of selected country

  const BottomNavBar({
    super.key,
    required this.index,
    required this.selectedCountry, // ✅ Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                HomeScreen.routeName,
                arguments: selectedCountry, // ✅ Pass country as argument
              );
            },
            icon: const Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                DiscoverScreen.routeName,
                arguments: selectedCountry, // ✅ Pass country
              );
            },
            icon: const Icon(Icons.search),
          ),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                LearnScreen.routeName,
                arguments: selectedCountry, // ✅ Pass country
              );
            },
            icon: const Icon(Icons.school), // 🎓 Learn Icon
          ),
          label: 'Learn',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.routeName);
            },
            icon: const Icon(Icons.person),
          ),
          label: 'Me',
        ),
      ],
    );
  }
}
