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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Config().deviceWidth(context),
                    height: Config().deviceHeight(context) * 0.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: CachedNetworkImageProvider(
                        imagebaseULR + newList[1].posterPath,
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
                            white.withOpacity(0.4),
                            white.withOpacity(0.8),
                            white.withOpacity(1),
                          ])),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: SizedBox(
                  height: 600,
                  child: CarouselSlider(
                    carouselController: controller,
                    options: CarouselOptions(
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