import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomArticle extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String author;

  const CustomArticle(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.author});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 100,
            //   width: 150,
            //   child: Image.network(
            //     cubit.businessNewsModel!.articles![index].urlToImage??"",
            //   ),
            // ),
            SizedBox(
              height: 100,
              width: 150,
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              // cubit.newsModel!.articles![index]
              //         .urlToImage ??
              //     "",
              // ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      author,
                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
