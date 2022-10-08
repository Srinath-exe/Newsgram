import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/story/StoriesPage.dart';
import 'package:news_app/story/model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../constants/constants.dart';

class NewsStory extends StatefulWidget {
  const NewsStory({super.key});

  @override
  State<NewsStory> createState() => _NewsStoryState();
}

class _NewsStoryState extends State<NewsStory> {
  final NewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() {
        return controller.allnews.length < 8
            ? storyShimmer()
            : Row(
                children: List.generate(controller.finLis.length, (index) {
                  return story(
                      index: index,
                      list: controller.finLis.values.elementAt(index),
                      imgLink:
                          imgs(tag: controller.finLis.keys.elementAt(index)),
                      title: controller.finLis.keys.elementAt(index));
                }),
              );
      }),
    );
  }

  Widget storyShimmer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              5,
              (index) => Shimmer(
                  loop: 0,
                  period: const Duration(milliseconds: 4000),
                  gradient: LinearGradient(colors: [grey, lightgrey]),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30,
                    ),
                  )))),
    );
  }

  story(
      {required String imgLink,
      required String title,
      required int index,
      required List<NewsArticleModel> list}) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 0.0, right: 8, left: index == 0 ? 12 : 0),
      child: ZoomTapAnimation(
        onTap: () {
          showDialog(
              barrierColor: black,
              context: context,
              builder: (BuildContext context) {
                return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 10;
                      if (details.delta.dy > sensitivity ||
                          details.delta.dy < -sensitivity) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: StoriesPage(
                      list: list,
                      title: title,
                      index: index,
                    ));
              });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      width: 4,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(image: AssetImage(imgLink))),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(capitalize(title))
          ],
        ),
      ),
    );
  }
}
