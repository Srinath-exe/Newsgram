import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NewsSimmerCard extends StatefulWidget {
  NewsSimmerCard({
    super.key,
  });

  @override
  State<NewsSimmerCard> createState() => _NewsSimmerCardState();
}

class _NewsSimmerCardState extends State<NewsSimmerCard> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: Config().deviceWidth(context),
          // height: Config().deviceHeight(context) * 0.3,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Shimmer(
                  loop: 0,
                  period: const Duration(milliseconds: 4000),
                  gradient: LinearGradient(colors: [secondary, white]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Config().deviceWidth(context) * 1,
                        height: Config().deviceHeight(context) * 0.2,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: grey,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: grey),
                            width: 100,
                            height: 20,
                          ))
                    ],
                  ),
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "",
                        style: TextStyle(color: black, fontSize: 12),
                      ),
                    ).frosted(
                        frostColor: white,
                        frostOpacity: 0.2,
                        borderRadius: BorderRadius.circular(10))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
