import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Cards/MovieCard.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/movies/searchBar.dart';

import '../Models/f.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<MovieScreen> {
  final MovieController controller = Get.find();
  late DateTime date;
  DateTime now = DateTime.now();
  ScrollController scrol = ScrollController();
  TextEditingController searchController = TextEditingController();
  onend() {
    scrol.addListener(() {
      if (scrol.offset == scrol.position.maxScrollExtent) {
        controller.fetchMoreMovies();
      }
    });
  }

  @override
  void initState() {
    date = now;
    onend();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            CustomSearchBar(
              controller: searchController,
              onSubmit: (s) {
                print(s);
                controller.searchMovies(query: s);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => GridView(
                    controller: scrol,
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.67),
                    children: List.generate(
                        controller.moviesList.length,
                        (index) => MovieCard(
                              movie: controller.moviesList[index],
                            )).toList(),
                  )),
            ),
          ],
        )));
  }
}
