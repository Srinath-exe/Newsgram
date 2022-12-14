import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/controllers/NewsController.dart';

class HomeNewsCards extends StatefulWidget {
  bool? notHome;
  HomeNewsCards({super.key, this.notHome = false});

  @override
  State<HomeNewsCards> createState() => _HomeNewsCardsState();
}

class _HomeNewsCardsState extends State<HomeNewsCards> {
  final NewsController controller = Get.find();
  late bool check = false;
  @override
  void initState() {
    super.initState();
    check = widget.notHome!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Obx(() => CarouselSlider.builder(
                itemCount: check
                    ? controller.world.length
                    : controller.homeNewsArticles.length,
                options: CarouselOptions(
                    aspectRatio: 3 / 3.2,
                    clipBehavior: Clip.none,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 16),
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    viewportFraction: 0.8),
                itemBuilder: (context, itemIndex, realIndex) {
                  if (controller.homeNewsArticles == null) {
                    return const CircularProgressIndicator();
                  }
                  return HomeNewsCard(
                      news: check
                          ? controller.world[itemIndex]
                          : controller.homeNewsArticles[itemIndex]);
                },
              ))),
    );
  }
}
