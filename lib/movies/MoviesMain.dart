import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/movies/OvalCard.dart';
import 'package:scaled_list/scaled_list.dart';

class MoviesMain extends StatefulWidget {
  const MoviesMain({super.key});

  @override
  State<MoviesMain> createState() => _MoviesMainState();
}

class _MoviesMainState extends State<MoviesMain> {
  CarouselController controller = new CarouselController();
  int curr = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                      switchInCurve: Curves.bounceInOut,
                      duration: Duration(milliseconds: 200),
                      child: Container(
                        key: Key(newList[curr].backdropPath),
                        width: Config().deviceWidth(context),
                        height: Config().deviceHeight(context) * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: CachedNetworkImageProvider(
                            imagebaseULR + newList[curr].backdropPath,
                            errorListener: () {},
                          ),
                        )),
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                white.withOpacity(0.2),
                                white.withOpacity(0.8),
                                white.withOpacity(1),
                              ])),
                        ),
                      ),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(opacity: animation, child: child);
                      }),
                ],
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: SizedBox(
                    height: 600,
                    child: CarouselSlider(
                      carouselController: controller,
                      options: CarouselOptions(
                          onPageChanged: (i, r) {
                            setState(() {
                              curr = i;
                            });
                          },
                          onScrolled: (val) {
                            // log(val.toString());
                          },
                          height: 600.0,
                          clipBehavior: Clip.none,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          viewportFraction: 0.8),
                      items: List.generate(newList.length,
                          (index) => OvalCard(movie: newList[index])),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// CarouselSlider(
//         carouselController: controller,
//         options: CarouselOptions(
//             height: 600.0,
//             clipBehavior: Clip.none,
//             autoPlay: false,
//             enlargeCenterPage: true,
//             enlargeStrategy: CenterPageEnlargeStrategy.scale,
//             viewportFraction: 0.8),
//         items: List.generate(
//             newList.length, (index) => OvalCard(movie: newList[index])),
//       ),