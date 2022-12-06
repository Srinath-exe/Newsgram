import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/story/TopicStory.dart';

import '../controllers/NewsController.dart';

class StoriesPage extends StatefulWidget {
  String title;
  List<NewsArticleModel> list;
  int index;
  StoriesPage(
      {super.key,
      required this.list,
      required this.title,
      required this.index});

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
        return TopicStory(
          newslist: controller.finLis.values.elementAt(index),
          title: controller.finLis.keys.elementAt(index),
          onNext: (next) {
            setState(() {
              if (next) {
                _sliderController.nextPage(const Duration(milliseconds: 200));
              } else {
                _sliderController
                    .previousPage(const Duration(milliseconds: 200));
              }
            });
          },
        );
      },
      slideTransform: const CubeTransform(),
      itemCount: controller.allnews.length,
      initialPage: widget.index,
    ));
  }
}
