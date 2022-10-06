import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Cards/MovieCard.dart';
import 'package:news_app/Cards/NewsArticleCard.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/movies/searchBar.dart';

import '../Models/f.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<NewsScreen> {
  final NewsController controller = Get.find();
  late DateTime date;
  DateTime now = DateTime.now();
  // ScrollController scrol = ScrollController();
  TextEditingController searchController = TextEditingController();
  // onend() {
  //   scrol.addListener(() {
  //     if (scrol.offset == scrol.position.maxScrollExtent) {
  //       controller.fetchMoreMovies();
  //     }
  //   });
  // }

  @override
  void initState() {
    date = now;
    // onend();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                CustomSearchBar(
                  controller: searchController,
                  onSubmit: (s) {
                    print(s);
                    // controller.searchMovies(query: s);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                            controller.homeNewsArticles.length,
                            (index) => NewsArticleCard(
                                  news: controller.homeNewsArticles[index],
                                )).toList(),
                      ),
                    )),
              ],
            ),
          ),
        )));
  }
}
