import 'package:advstory/advstory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/Cards/NewsArticleCard.dart';
import 'package:news_app/Cards/SearchNewsArcticleCard.dart';
import 'package:news_app/HomeScreen/widgets/homeShimmerCard.dart';
import 'package:news_app/story/NewsStory.dart';
import 'package:news_app/HomeScreen/widgets/homeNewscards.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:shimmer/shimmer.dart';

import '../Models/f.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NewsStory(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Headlines",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              color: black),
                        ),
                      ],
                    ),
                  ),
                  controller.isLoading.value
                      ? HomeSimmerCard()
                      : const HomeNewsCards(),
                ],
              )),
        ),
      )),
    );
  }
}
