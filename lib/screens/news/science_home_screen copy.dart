import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base_widgets/custom_article.dart';
import 'package:flutter_application_1/cubit/logic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScienceHomeScreen extends StatelessWidget {
  const ScienceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogicCubit()..getSceience(),
      child: BlocBuilder<LogicCubit, LogicState>(
        builder: (context, state) {
          var cubit = LogicCubit.get(context);
          return Scaffold(
            body: cubit.scienceNewsModel == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemBuilder: (context, index) {
                      // return InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     padding: const EdgeInsets.all(5),
                      //     margin: const EdgeInsets.all(5),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         // SizedBox(
                      //         //   height: 100,
                      //         //   width: 150,
                      //         //   child: Image.network(
                      //         //     cubit.scienceNewsModel!.articles![index]
                      //         //             .urlToImage ??
                      //         //         "",
                      //         //   ),
                      //         // ),
                      //         SizedBox(
                      //           height: 100,
                      //           width: 150,
                      //           child: CachedNetworkImage(
                      //             imageUrl: cubit.scienceNewsModel!
                      //                     .articles![index].urlToImage ??
                      //                 "",
                      //             placeholder: (context, url) => Center(
                      //                 child: CircularProgressIndicator()),
                      //             errorWidget: (context, url, error) =>
                      //                 Icon(Icons.error),
                      //           ),
                      //           // Image.network(
                      //           // cubit.newsModel!.articles![index]
                      //           //         .urlToImage ??
                      //           //     "",
                      //           // ),
                      //         ),
                      //         const SizedBox(
                      //           width: 5,
                      //         ),
                      //         Expanded(
                      //           child: Container(
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   cubit.scienceNewsModel!.articles![index]
                      //                           .title ??
                      //                       "",
                      //                   maxLines: 1,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   style: const TextStyle(
                      //                       color: Colors.black,
                      //                       fontSize: 20,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 2,
                      //                 ),
                      //                 Text(
                      //                   cubit.scienceNewsModel!.articles![index]
                      //                           .description ??
                      //                       "",
                      //                   maxLines: 2,
                      //                   overflow: TextOverflow.ellipsis,
                      //                   style: const TextStyle(
                      //                       color: Colors.black,
                      //                       fontSize: 18,
                      //                       fontWeight: FontWeight.w500),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 5,
                      //                 ),
                      //                 Text(
                      //                   cubit.scienceNewsModel!.articles![index]
                      //                           .author ??
                      //                       "",
                      //                   style: const TextStyle(
                      //                       color: Colors.grey, fontSize: 15),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                      return CustomArticle(
                          title:
                              cubit.scienceNewsModel!.articles![index].title ??
                                  "",
                          description: cubit.scienceNewsModel!.articles![index]
                                  .description ??
                              "",
                          image: cubit.scienceNewsModel!.articles![index]
                                  .urlToImage ??
                              "",
                          author: cubit
                                  .scienceNewsModel!.articles![index].author ??
                              "");
                    },
                    itemCount: cubit.scienceNewsModel!.articles!.length,
                  ),
          );
        },
      ),
    );
  }
}