import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/movies/MovieCard.dart';
import 'package:news_app/movies/movieSimmerCard.dart';
import 'package:news_app/movies/searchBar.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<MovieScreen> {
  final MovieController controller = Get.find();

  ScrollController scrol = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    log("message");
                    controller.searchMovies(query: "");
                    controller.showTopRelated(0);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                chips(),
                Container(child: Center(
                  child: Obx(() {
                    if (controller.noSearchresult.value == true) {
                      return const NotFound();
                    }
                    if (controller.isLoading.value == false &&
                        controller.noSearchresult.value == false &&
                        controller.mainMovieList.isEmpty) {
                      return retry();
                    }
                    return GridView(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.68),
                      children: !controller.isLoading.value ||
                              controller.mainMovieList.isNotEmpty
                          ? controller.mainMovieList
                              .map((e) => MovieCard(movie: e))
                              .toList()
                          : List.generate(
                              4, (index) => const MovieShimmerCard()),
                    );
                  }),
                )),
              ],
            ),
          )),
        ));
  }

  retry() {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Connection reset by peer",
          style: TextStyle(fontSize: 20),
        ),
        Lottie.asset(
          'assets/lottie/error.json',
        ),
        Container(
          width: 160,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: OutlinedButton(
            child: const Text('Retry'),
            style: OutlinedButton.styleFrom(
              foregroundColor: black,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              controller.retryMovie();
            },
          ),
        )
      ]),
    );
  }

  int selected = 0;
  chips() {
    cells({required int id, required String title}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        child: ZoomTapAnimation(
          onTap: () {
            setState(() {
              selected = id;
              controller.showTopRelated(id);
            });
          },
          child: Chip(
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
              child: Text(
                title,
                style: TextStyle(
                  color: id == selected ? white : black,
                ),
              ),
            ),
            backgroundColor: id == selected ? black : lightgrey,

            // : BorderRadius.circular(20),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          cells(id: 0, title: "In Theaters"),
          cells(id: 1, title: "Upcoming"),
          cells(id: 2, title: "Popular"),
          cells(id: 3, title: "Top Rated"),
        ],
      ),
    );
  }
}
