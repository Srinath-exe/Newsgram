import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/constants/constants.dart';

class HomeNewsCards extends StatefulWidget {
  const HomeNewsCards({super.key});

  @override
  State<HomeNewsCards> createState() => _HomeNewsCardsState();
}

class _HomeNewsCardsState extends State<HomeNewsCards> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: Config().deviceHeight(context) * 0.6,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 3 / 3.2,
                      clipBehavior: Clip.none,
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      // enlargeCenterPage: true,
                      // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      autoPlayInterval: const Duration(seconds: 16),
                      viewportFraction: 0.94),
                  items: [
                    HomeNewsCard(
                      news: newsArt,
                    ),
                    HomeNewsCard(news: newsArt)
                  ]
                  // List.generate(
                  //     treks.length,
                  //     (index) => TrekCard(
                  //           trek: treks[index],
                  //         )).toList(),
                  )),
        ],
      ),
    );
  }
}
