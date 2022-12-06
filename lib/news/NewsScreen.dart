import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Cards/SearchPost.dart';
import 'package:news_app/Cards/ShimmerPost.dart';
import 'package:news_app/HomeScreen/widgets/homeNewscards.dart';
import 'package:news_app/HomeScreen/widgets/homeShimmerCard.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/movies/searchBar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<NewsScreen> {
  final NewsController controller = Get.find();
  late DateTime date;
  DateTime now = DateTime.now();

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    date = now;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                CustomSearchBar(
                  controller: searchController,
                  onSubmit: (s) {
                    controller.searchNews(search: s);
                  },
                  onClose: () {
                    log("CLOSED");
                    controller.isSearch.value = false;
                    controller.isSearchLoading.value = false;
                    // controller.searchNews(search: "");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                          children: controller.isSearch.value
                              ? !controller.isSearchLoading.value
                                  ? List.generate(
                                      controller.searchNewsArticles.length,
                                      (index) {
                                      log("isSearchLoading " +
                                          controller.isSearchLoading.value
                                              .toString());
                                      return SearchPost(
                                        news: controller
                                            .searchNewsArticles[index],
                                      );
                                    })
                                  : [const ShimmerPost()]
                              : [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Headlines",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => controller.isLoading.value
                                        ? HomeSimmerCard()
                                        : HomeNewsCards(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 24),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "World News",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Obx(
                                    () => controller.isworld.value
                                        ? HomeSimmerCard()
                                        : HomeNewsCards(
                                            notHome: true,
                                          ),
                                  )
                                ]
                          //  Obx(
                          //   () => controller.isLoading.value
                          //       ? HomeSimmerCard()
                          //       : const HomeNewsCards(),
                          // );
                          //  List.generate(
                          //     controller.homeNewsArticles.length + 2,
                          //     (index) {
                          //     if (index >=
                          //         controller.homeNewsArticles.length) {
                          //       return NewsSimmerCard();
                          //     }
                          //     return controller.isLoading.value
                          //         ? NewsSimmerCard()
                          //         : NewsArticleCard(
                          //             news:
                          //                 controller.homeNewsArticles[index],
                          //           );
                          //   }).toList(),
                          ),
                    )),
              ],
            ),
          ),
        )));
  }
}
