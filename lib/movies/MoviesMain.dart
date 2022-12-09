import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/movies/OvalCard.dart';

class MoviesMain extends StatefulWidget {
  const MoviesMain({super.key});

  @override
  State<MoviesMain> createState() => _MoviesMainState();
}

class _MoviesMainState extends State<MoviesMain> {
  final MovieController controller = Get.find();
  CarouselController carouselController = new CarouselController();
  int curr = 0;
  int carouselIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: Container(
            child: Obx(
          () => Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedSwitcher(
                      switchInCurve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        key: Key(
                            controller.carouselMoviesList[curr].id.toString()),
                        width: Config().deviceWidth(context),
                        height: Config().deviceHeight(context) * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: CachedNetworkImageProvider(
                            imagebaseULR +
                                controller
                                    .carouselMoviesList[curr].backdropPath!,
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
                        return FadeTransition(
                            alwaysIncludeSemantics: true,
                            opacity: animation,
                            child: child);
                      }),
                ],
              ),
              // Positioned(
              //     top: 10,
              //     left: 20,
              //     child: SafeArea(
              //         child: CustomBack(
              //       color: white,
              //     ))),
              Positioned(
                top: 100,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: SizedBox(
                    height: 600,
                    width: Config().deviceWidth(context),
                    child: CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                          onPageChanged: (i, r) {
                            setState(() {
                              curr = i;
                            });
                          },
                          height: 600.0,
                          clipBehavior: Clip.none,
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          viewportFraction: 0.78),
                      items: List.generate(
                          controller.carouselMoviesList.length,
                          (index) => OvalCard(
                              movie: controller.carouselMoviesList[index])),
                    ),
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                width: Config().deviceWidth(context),
                height: 50,
                color: white,
                child: CarouselSlider(
                  items: [
                    cells(0, "In Theaters"),
                    cells(1, "Upcoming"),
                    cells(2, "Popular"),
                    cells(3, "Top Rated"),
                  ],
                  options: CarouselOptions(
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 2000),
                      onPageChanged: (i, r) {
                        setState(() {
                          carouselIndex = i;
                        });
                        controller.showCarousel(i);
                      },
                      height: 50.0,
                      clipBehavior: Clip.none,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      viewportFraction: 0.3),
                ),
              )),
              const Positioned(child: Icon(Icons.arrow_drop_up))
            ],
          ),
        )));
  }

  cells(int index, String s) {
    return Column(
      children: [
        Text(
          s,
          style: carouselIndex == index
              ? const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
              : const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
