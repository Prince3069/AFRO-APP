import 'package:afro_caribbean/models/article_model.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_tag.dart';
import '../widgets/image_container.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});
  static const routeName = '/article';
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return ImageContainer(
        imageUrl: article.imageUrl,
        width: double.infinity,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              _NewsHeadline(
                article: article,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    Row(
                      children: [
                        CustomTag(
                          backgroundColor: Colors.black.withAlpha(150),
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundImage:
                                  NetworkImage(article.authorImageUrl),
                            ),
                            Text(
                              article.author,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Image.network(
                                "https://www.google.com/imgres?imgurl=https%3A%2F%2Fbusinesstrumpet.com%2Fwp-content%2Fuploads%2F2020%2F06%2FUniversity-of-Nigeria-799x445.jpg&imgrefurl=https%3A%2F%2Fbusinesstrumpet.com%2Ffour-nigerian-universities-ranked-among-the-top-1400-universities-in-the-world%2F&tbnid=ousT9Wt5uZZi8M&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ..i&docid=QDDrK2_VD93KEM&w=799&h=445&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ")
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        //   ],
                        // ),
                        CustomTag(
                          backgroundColor: Colors.grey.shade200,
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.grey,
                            ),
                            Text(
                                '${DateTime.now().difference(article.createdAt).inHours} hr',
                                style: const TextStyle(fontSize: 12)),
                            Image.network(
                                "https://www.google.com/imgres?imgurl=https%3A%2F%2Fbusinesstrumpet.com%2Fwp-content%2Fuploads%2F2020%2F06%2FUniversity-of-Nigeria-799x445.jpg&imgrefurl=https%3A%2F%2Fbusinesstrumpet.com%2Ffour-nigerian-universities-ranked-among-the-top-1400-universities-in-the-world%2F&tbnid=ousT9Wt5uZZi8M&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ..i&docid=QDDrK2_VD93KEM&w=799&h=445&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ")
                          ],
                        ),
                        // CustomTag(
                        //     backgroundColor: Colors.grey.shade200,
                        //     children: [
                        //       Icon(
                        //         Icons.remove_red_eye,
                        //         color: Colors.grey,
                        //       ),
                        //       Text('articles.views',
                        //           style: const TextStyle(fontSize: 12)),
                        //       Image.network(
                        //           "https://www.google.com/imgres?imgurl=https%3A%2F%2Fbusinesstrumpet.com%2Fwp-content%2Fuploads%2F2020%2F06%2FUniversity-of-Nigeria-799x445.jpg&imgrefurl=https%3A%2F%2Fbusinesstrumpet.com%2Ffour-nigerian-universities-ranked-among-the-top-1400-universities-in-the-world%2F&tbnid=ousT9Wt5uZZi8M&vet=12ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ..i&docid=QDDrK2_VD93KEM&w=799&h=445&q=photos%20of%20nigerian%20universities&ved=2ahUKEwih1s7Pud36AhX0pycCHUhxDxkQMygCegUIARDgAQ")
                        //     ]),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      article.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      article.body,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.5),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 2,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 2, childAspectRatio: 1.25),
                      itemBuilder: (context, index) {
                        return ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.42,
                          imageUrl: article.imageUrl,
                          margin: const EdgeInsets.only(right: 5, top: 5),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    required this.article,
    Key? key,
  }) : super(key: key);
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                article.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, height: 1),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold, height: 1),
          ),
        ],
      ),
    );
  }
}
