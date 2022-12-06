import 'package:flutter/material.dart';

import 'package:news_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeSimmerCard extends StatefulWidget {
  HomeSimmerCard({super.key});

  @override
  State<HomeSimmerCard> createState() => _HomeSimmerCardState();
}

class _HomeSimmerCardState extends State<HomeSimmerCard> {
  TextStyle mainstyle = TextStyle(
      fontSize: 24,
      letterSpacing: 0.6,
      // fontWeight: FontWeight.w500,
      color: white);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(30),
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: Config().deviceHeight(context) * 0.45,
            width: Config().deviceWidth(context) * 0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [lightgrey, secondary]),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Shimmer(
                      loop: 0,
                      period: const Duration(milliseconds: 2000),
                      gradient: LinearGradient(colors: [secondary, lightgrey]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: grey),
                                width: Config().deviceWidth(context) * 0.7,
                                height: 30,
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: grey),
                                width: Config().deviceWidth(context) * 0.75,
                                height: 30,
                              )),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: grey),
                                width: Config().deviceWidth(context) * 0.4,
                                height: 30,
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: grey),
                                width: Config().deviceWidth(context) * 0.2,
                                height: 20,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Config().deviceWidth(context) * 0.8,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: grey),
                                      width:
                                          Config().deviceWidth(context) * 0.2,
                                      height: 20,
                                    )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: grey),
                                      width:
                                          Config().deviceWidth(context) * 0.2,
                                      height: 20,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Shimmer(
                        loop: 0,
                        period: const Duration(milliseconds: 2000),
                        gradient:
                            LinearGradient(colors: [secondary, lightgrey]),
                        child: Icon(
                          Icons.newspaper_rounded,
                          color: white,
                          size: 160,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
