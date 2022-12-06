import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/constants/constants.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../Models/searchNewsModel.dart';

class SearchNewsArticleCard extends StatefulWidget {
  SearchNewsArticleList news;
  SearchNewsArticleCard({super.key, required this.news});

  @override
  State<SearchNewsArticleCard> createState() => _NewsArticleCardState();
}

class _NewsArticleCardState extends State<SearchNewsArticleCard> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://www.nytimes.com/${widget.news.multimedia![0].url}",
                          fit: BoxFit.cover,
                          width: Config().deviceWidth(context) * 1,
                          height: Config().deviceHeight(context) * 0.2,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            widget.news.headline!.main,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                    right: 10,
                    top: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        timeago.format(
                          DateTime.parse(widget.news.pubDate!),
                        ),
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
