import 'package:advstory/advstory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/NewsController.dart';

class HomeNewsCards extends StatefulWidget {
  const HomeNewsCards({
    super.key,
  });

  @override
  State<HomeNewsCards> createState() => _HomeNewsCardsState();
}

class _HomeNewsCardsState extends State<HomeNewsCards> {
  final NewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      // height: Config().deviceHeight(context) * 0.6,
      // width: Config().deviceWidth(context),
      child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Obx(() => CarouselSlider.builder(
                itemCount: controller.homeNewsArticles.length,
                options: CarouselOptions(
                    aspectRatio: 3 / 3.2,
                    clipBehavior: Clip.none,
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    autoPlayInterval: const Duration(seconds: 16),
                    viewportFraction: 0.94),
                itemBuilder: (context, itemIndex, realIndex) {
                  if (controller.homeNewsArticles == null) {
                    return CircleAvatar(
                      radius: 100,
                      backgroundColor: black,
                    );
                  }
                  return HomeNewsCard(
                      news: controller.homeNewsArticles[itemIndex]);
                },
              ))),
    );
  }
}
