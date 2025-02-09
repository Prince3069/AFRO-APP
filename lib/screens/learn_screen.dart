import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  static const String routeName = '/learn';

  const LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn & Teach"),
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏫 Intro Section
            Text(
              "Explore a world of learning!",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "Learn new languages, traditional food, and cultural arts. Start teaching or take a course today!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),

            // 🔍 Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (query) {
                // Implement search logic
              },
            ),
            const SizedBox(height: 24),

            // 📚 Categories Section (Fixed Overflow)
            Text(
              "Categories",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CategoryTile(
                      title: "Languages",
                      icon: Icons.language,
                      onTap: () {
                        Navigator.pushNamed(context, '/learn/languages');
                      },
                    ),
                    _CategoryTile(
                      title: "Food",
                      icon: Icons.restaurant_menu,
                      onTap: () {
                        Navigator.pushNamed(context, '/learn/food');
                      },
                    ),
                    _CategoryTile(
                      title: "Culture & Arts",
                      icon: Icons.palette,
                      onTap: () {
                        Navigator.pushNamed(context, '/learn/culture');
                      },
                    ),
                    _CategoryTile(
                      title: "Music",
                      icon: Icons.music_note,
                      onTap: () {
                        Navigator.pushNamed(context, '/learn/music');
                      },
                    ),
                    _CategoryTile(
                      title: "More",
                      icon: Icons.more_horiz,
                      onTap: () {
                        Navigator.pushNamed(context, '/learn/more');
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 🎓 Featured Courses
            Text(
              "Popular Courses",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: const [
                  _CourseCard(
                    title: "Learn Spanish in 30 Days",
                    instructor: "Maria Gonzales",
                    imageUrl: "https://via.placeholder.com/150",
                  ),
                  _CourseCard(
                    title: "Traditional Caribbean Dishes",
                    instructor: "Chef Johnson",
                    imageUrl: "https://via.placeholder.com/150",
                  ),
                  _CourseCard(
                    title: "Master African Drumming",
                    instructor: "Kwame Nkrumah",
                    imageUrl: "https://via.placeholder.com/150",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🎨 Category Tile Widget
class _CategoryTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

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
        onTap: onTap,
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

// 📖 Course Card Widget
class _CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String imageUrl;

  const _CourseCard({
    Key? key,
    required this.title,
    required this.instructor,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child:
              Image.network(imageUrl, width: 60, height: 60, fit: BoxFit.cover),
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Instructor: $instructor"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Navigate to course details
        },
      ),
    );
  }
}
