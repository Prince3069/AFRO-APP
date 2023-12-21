// import 'package:flutter/foundation.dart';
import 'package:afro_caribbean/models/food_model.dart';
import 'package:afro_caribbean/models/science_model.dart';
import 'package:afro_caribbean/models/sport_model.dart';
import 'package:afro_caribbean/widgets/image_container.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';
import 'article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Transform.scale(
          scale: 1.5,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 1),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [_DiscoverNews(), _CategoryNews()],
      ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  const _CategoryNews();

  @override
  State<_CategoryNews> createState() => __CategoryNewsState();
}

class __CategoryNewsState extends State<_CategoryNews> {
  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    final sciences = Science.sciences;
    final foods = Food.foods;
    final sports = Sport.sports;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: Container(
          child: DefaultTabController(
              length: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Material(
                      child: Container(
                        // height: MediaQuery.of(context).size.height,
                        height: 45,
                        color: Colors.white,
                        child: TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.black,
                          // physics: ClampingScrollPhysics(),
                          // padding: EdgeInsets.only(
                          //   top: 10,
                          // ),
                          // unselectedLabelColor: Color.fromARGB(255, 65, 45, 136),
                          // indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("History",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Tab(
                              child: SizedBox(
                                height: 50,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     border:
                                //         Border.all(color: Colors.pinkAccent)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Science",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Tab(
                              child: SizedBox(
                                height: 50,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     border:
                                //         Border.all(color: Colors.pinkAccent)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Food",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Tab(
                              child: SizedBox(
                                height: 50,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     border:
                                //         Border.all(color: Colors.pinkAccent)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Sports",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            // height: 100,
                            // width: 50,
                            ),
                        Expanded(
                          child: SizedBox(
                            // height: 200,
                            // width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            child: TabBarView(
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: articles.length,
                                  separatorBuilder:
                                      ((BuildContext context, int index) =>
                                          const Divider()),
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ArticleScreen.routeName,
                                            arguments: articles[index]);
                                      },
                                      child: Row(
                                        children: [
                                          ImageContainer(
                                            width: 100,
                                            height: 80,
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 10, bottom: 10),
                                            borderRadius: 0.1,
                                            imageUrl: articles[index].imageUrl,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  articles[index].title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.schedule,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        '${DateTime.now().difference(articles[index].createdAt).inHours} hr',
                                                        style: const TextStyle(
                                                            fontSize: 12)),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                      Icons.visibility,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '${articles[index].views}views',
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: sciences.length,
                                  separatorBuilder:
                                      ((BuildContext context, int index) =>
                                          const Divider()),
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ArticleScreen.routeName,
                                            arguments: sciences[index]);
                                      },
                                      child: Row(
                                        children: [
                                          ImageContainer(
                                            width: 100,
                                            height: 80,
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 10, bottom: 10),
                                            borderRadius: 0.1,
                                            imageUrl: sciences[index].imageUrl,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  sciences[index].title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.schedule,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        '${DateTime.now().difference(sciences[index].createdAt).inHours} hr',
                                                        style: const TextStyle(
                                                            fontSize: 12)),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                      Icons.visibility,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '${sciences[index].views}views',
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: foods.length,
                                  separatorBuilder:
                                      ((BuildContext context, int index) =>
                                          const Divider()),
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ArticleScreen.routeName,
                                            arguments: foods[index]);
                                      },
                                      child: Row(
                                        children: [
                                          ImageContainer(
                                            width: 100,
                                            height: 80,
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 10, bottom: 10),
                                            borderRadius: 0.1,
                                            imageUrl: foods[index].imageUrl,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  foods[index].title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.schedule,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        '${DateTime.now().difference(foods[index].createdAt).inHours} hr',
                                                        style: const TextStyle(
                                                            fontSize: 12)),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                      Icons.visibility,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '${foods[index].views}views',
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: sports.length,
                                  separatorBuilder:
                                      ((BuildContext context, int index) =>
                                          const Divider()),
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ArticleScreen.routeName,
                                            arguments: sports[index]);
                                      },
                                      child: Row(
                                        children: [
                                          ImageContainer(
                                            width: 100,
                                            height: 80,
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 10, bottom: 10),
                                            borderRadius: 0.1,
                                            imageUrl: sports[index].imageUrl,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  sports[index].title,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.clip,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.schedule,
                                                      size: 18,
                                                    ),
                                                    const SizedBox(width: 5),
                                                    Text(
                                                        '${DateTime.now().difference(sports[index].createdAt).inHours} hr',
                                                        style: const TextStyle(
                                                            fontSize: 12)),
                                                    const SizedBox(width: 20),
                                                    const Icon(
                                                      Icons.visibility,
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      '${sports[index].views}views',
                                                      style: const TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                    const SizedBox(
                                                      height: 25,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                                // Center(
                                //   child: Text("History"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

// class MyNews extends StatelessWidget {
//   const MyNews({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  _CategoryNews();
//   }
// }

// abstract class NewsProvider extends _CategoryNews {
//   NewsProvider() {
//     super.createState();
//     _CategoryNews createState() => _CategoryNews();
//   }
// }

// class _CategoryNews extends StatefulWidget {
//   @override
//   _CategoryNews createState() =>
//   _CategoryNews();
// }

// class __CategoryNews extends State<_CategoryNews>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('List in Tabs'),
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: [
//               Tab(text: 'Tab 1'),
//               Tab(text: 'Tab 2'),
//               Tab(text: 'Tab 3'),
//             ],
//           ),
//         ),
//         body: ListView(
//           children: [
//             TabBarView(
//               controller: _tabController,
//               children: [
//                 Container(
//                   child: Text('Content of Tab 1'),
//                 ),
//                 Container(
//                   child: Text('Content of Tab 2'),
//                 ),
//                 Container(
//                   child: Text('Content of Tab 3'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _CategoryNews extends StatefulWidget {
//   const _CategoryNews({super.key});

//   @override
//   State<_CategoryNews> createState() => __CategoryNewsState();
// }

// class __CategoryNewsState extends State<_CategoryNews> with TickerProviderStateMixin {
//   // final TabController _controller = TabController(
// //List of Tabs
//   List<String> tabs = [
//     'History',
//     'Current Affairs',
//     'Sports',
//     'Entertainment',
//     'Food',
//     'Culture',
//     'Politics',
//     'Art',
//     'Science',
//     'Health'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return const DefaultTabController(
//         length: 9,
//         child: TabBar(
//           tabs: [
//             Tab(
//               text: "History",
//             ),
//             Tab(
//               text: 'Current Affairs',
//             ),
//             Tab(
//               text: 'Sports',
//             ),
//             Tab(
//               text: 'Entertainment',
//             ),
//             Tab(
//               text: 'Food',
//             ),
//             Tab(
//               text: 'Culture',
//             ),
//             Tab(
//               text: 'Politics',
//             ),
//             Tab(
//               text: 'Art',
//             ),
//             Tab(
//               text: "Science",
//             ),
//             Tab(
//               text: "Health",
//             )
//           ],
//         ));
//     TabBarView(controller: _controller, children: []);
//   }
// }

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.tune, color: Colors.grey),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
