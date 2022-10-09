import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Cards/MovieCard.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/movies/movieSimmerCard.dart';
import 'package:news_app/movies/searchBar.dart';

import '../Models/f.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<MovieScreen> {
  final MovieController controller = Get.find();

  ScrollController scrol = ScrollController()..addListener(() {});
  TextEditingController searchController = TextEditingController();
  onend() {
    scrol.addListener(() {
      if (scrol.offset >= (scrol.position.maxScrollExtent - 400) &&
          controller.isSearch.value == false) {
        log("fetching More");
        controller.fetchMoreMovies();
      }
    });
  }

  @override
  void initState() {
    onend();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 4),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              CustomSearchBar(
                controller: searchController,
                onSubmit: (s) {
                  print(s);
                  controller.searchMovies(query: s);
                },
                onClose: () {
                  controller.searchMovies(query: "");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(() => GridView(
                    controller: scrol,
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.66),
                    children: List.generate(
                        controller.isSearch.value
                            ? controller.moviesList.length
                            : controller.moviesList.length + 4, (index) {
                      if (index >= controller.moviesList.length &&
                          controller.isSearch.value == false) {
                        return const MovieShimmerCard();
                      }
                      return MovieCard(
                        movie: controller.moviesList[index],
                      );
                    }).toList())),
              ),
            ],
          ),
        )));
  }
}
