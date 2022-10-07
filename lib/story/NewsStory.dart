import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/story/StoriesPage.dart';
import 'package:news_app/story/model.dart';
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
      child: Obx(() => Row(
            children: List.generate(1, (index) {
              for (var i = 0; i < controller.allnews.length; i++) {
                log(controller.allnews[i].length.toString());
              }
              // if (controller.allnewsload.value) {
              //   return CircleAvatar();
              // }
              // return story(
              //     imgLink: imgs(tag: controller.allnews[index][1].section),
              //     title: capitalize(controller.allnews[index][1].section));
              return CircleAvatar();
            }),
          )),
    );
  }

  story({required String imgLink, required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ZoomTapAnimation(
        onTap: () {
          showDialog(
              barrierColor: black,
              context: context,
              builder: (BuildContext context) {
                return const StoriesPage();
              });
        },
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(image: AssetImage(imgLink))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
