// import 'package:flutter/material.dart';

// import '../screens/screens.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         currentIndex: index,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black.withAlpha(100),
//         items: [
//           BottomNavigationBarItem(
//             icon: Container(
//               margin: const EdgeInsets.only(left: 50),
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, HomeScreen.routeName);
//                 },
//                 icon: const Icon(Icons.home),
//               ),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//               icon: IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, DiscoverScreen.routeName);
//                 },
//                 icon: const Icon(Icons.search),
//               ),
//               label: 'Discover'),
//           BottomNavigationBarItem(
//               icon: Container(
//                 margin: const EdgeInsets.only(right: 50),
//                 child: IconButton(
//                   onPressed: () {
//                     // ignore: avoid_print
//                     // Navigator.push(
//                     // context,
//                     // MaterialPageRoute(
//                     //  builder: (context) => ProfileScreen()));
//                     Navigator.pushNamed(context, ProfileScreen.routeName);
//                     // print('Profile page not yet created');
//                   },
//                   icon: const Icon(Icons.person),
//                 ),
//               ),
//               label: 'Me'),
//         ]);
//   }
// }
import 'package:afro_caribbean/screens/learn_screen.dart';
import 'package:flutter/material.dart';

import '../screens/screens.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

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
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
            icon: const Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, DiscoverScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, LearnScreen.routeName);
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
