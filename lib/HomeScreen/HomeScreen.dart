import 'dart:async';
import 'dart:developer';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/Cards/HomePost.dart';
import 'package:news_app/Cards/NewsArticleCard.dart';
import 'package:news_app/Cards/SearchNewsArcticleCard.dart';
import 'package:news_app/Cards/ShimmerPost.dart';
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
          child: Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 4),
              child: CustomRefreshIndicator(
                offsetToArmed: 50,
                builder: (
                  BuildContext context,
                  Widget child,
                  IndicatorController controller,
                ) {
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, _) {
                      return Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          !controller.isIdle
                              ? Positioned(
                                  top: 35.0 * controller.value,
                                  child: SizedBox(
                                    height: 30,
                                    child: Transform.scale(
                                      scale: 5.0 * controller.value,
                                      child: Row(
                                        children: [
                                          Lottie.asset(
                                            'assets/lottie/newsload.json',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Transform.translate(
                            offset: Offset(0, 100.0 * controller.value),
                            child: child,
                          ),
                        ],
                      );
                    },
                  );
                },
                onRefresh: () async {
                  return controller.onreload();
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const NewsStory(),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => controller.isLoading.value == true
                          ? Column(
                              children: [ShimmerPost(), ShimmerPost()],
                            )
                          : Column(
                              children: List.generate(
                                  controller.homeNewsArticles.length,
                                  (index) => HomePost(
                                      news: controller
                                          .homeNewsArticles[index])))),
                      Obx(() => controller.homeNewsArticles.isNotEmpty
                          ? Column(
                              children: [
                                Lottie.asset('assets/lottie/done.json',
                                    width: 100),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    " You're All Caught Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container()),
                      Obx(() => controller.homeNewsArticles.isEmpty
                          ? DelayedDisplay(
                              delay: const Duration(seconds: 10),
                              child: Image.asset(
                                "assets/images/Paper404Error.png",
                                width: Config().deviceWidth(context) * 0.9,
                              ),
                            )
                          : Container())
                    ],
                  ),
                ),
              ))),
    );
  }
}

// heart LOAD 
// Positioned(
//                                   top: 10.0 * controller.value,
//                                   child: Container(
//                                     color: black,
//                                     height: 80,
//                                     width: Config().deviceWidth(context),
//                                     child: Transform.scale(
//                                       scale: controller.value * 1,
//                                       child: Lottie.asset(
//                                           'assets/lottie/loading.json',
//                                           width: Config().deviceWidth(context) *
//                                               0.7),
//                                     ),
//                                   ),
//                                 )