import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/story/TopicStory.dart';
import 'package:news_app/story/model.dart';
import 'package:news_app/story/tempStory.dart';

import '../controllers/NewsController.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  bool _isPlaying = false;

  late CarouselSliderController _sliderController;

  final NewsController controller = Get.find();
  @override
  void initState() {
    _sliderController = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider.builder(
      controller: _sliderController,
      slideBuilder: (index) {
        return Obx(() => TopicStory(
              newslist: controller.allnews[index],
              onNext: (next) {
                setState(() {
                  if (next) {
                    _sliderController
                        .nextPage(const Duration(milliseconds: 200));
                  } else {
                    _sliderController
                        .previousPage(const Duration(milliseconds: 200));
                  }
                });
              },
            ));
      },
      slideTransform: const CubeTransform(),
      itemCount: controller.allnews.length,
      initialPage: 0,
    ));
  }
}
