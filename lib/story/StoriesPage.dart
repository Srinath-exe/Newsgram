import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  bool _isPlaying = false;

  late CarouselSliderController _sliderController;
  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];
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
        return Container(
          alignment: Alignment.center,
          color: colors[index],
          child: Text(
            letters[index],
            style: const TextStyle(fontSize: 200, color: Colors.white),
          ),
        );
      },
      slideTransform: const CubeTransform(),
      itemCount: colors.length,
      initialPage: 0,
    ));
  }
}
