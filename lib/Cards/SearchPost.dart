import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/story/model.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchPost extends StatefulWidget {
  SearchNewsArticleList news;
  SearchPost({super.key, required this.news});

  @override
  State<SearchPost> createState() => _SearchPostState();
}

class _SearchPostState extends State<SearchPost> {
  late CarouselSliderController _sliderController;
  double verpadding = 15;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Config().deviceWidth(context),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: verpadding, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: black,
                                image: DecorationImage(
                                    image: AssetImage(
                                      imgs(tag: widget.news.sectionName),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  capitalize(widget.news.sectionName),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                widget.news.subsectionName.isEmpty ||
                                        widget.news.subsectionName == "null"
                                    ? Container()
                                    : Text(
                                        capitalize(widget.news.subsectionName),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        timeago.format(
                          DateTime.parse(widget.news.pubDate),
                        ),
                        style: TextStyle(color: black, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Container(
                    width: Config().deviceWidth(context),
                    height: Config().deviceHeight(context) * 0.3,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: secondary),
                    child:
                        // widget.news.multimedia.length > 1
                        // ? CarouselSlider.builder(
                        //     controller: _sliderController,
                        //     slideBuilder: (index) {
                        //       return CachedNetworkImage(
                        //         imageUrl: widget.news.multimedia[index].url ==
                        //                 ""
                        //             ? "https://www.nytimes.com/${widget.news.multimedia[0].url}"
                        //             : "https://www.nytimes.com/${widget.news.multimedia[index].url}",
                        //         fit: BoxFit.cover,
                        //         width: Config().deviceWidth(context) * 1,
                        //         placeholder: (context, url) => Lottie.asset(
                        //             'assets/lottie/newsload.json',
                        //             width: 100),
                        //       );
                        //     },
                        //     slideIndicator: CircularSlideIndicator(
                        //       padding: EdgeInsets.only(bottom: 32),
                        //     ),
                        //     slideTransform: const CubeTransform(),
                        //     itemCount: widget.news.multimedia.length,
                        //     initialPage: 0,
                        //   )
                        CachedNetworkImage(
                      imageUrl: widget.news.multimedia[0].url == ""
                          ? "https://www.nytimes.com/${widget.news.multimedia[1].url}"
                          : "https://www.nytimes.com/${widget.news.multimedia[0].url}",
                      fit: BoxFit.cover,
                      width: Config().deviceWidth(context) * 1,
                      placeholder: (context, url) => Lottie.asset(
                        'assets/lottie/newsload.json',
                      ),
                    )),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: verpadding),
                  child: Text(
                    widget.news.headline.main,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: verpadding),
                  child: Text(
                    widget.news.docAbstract,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: verpadding),
                  child: Row(
                    children: [],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
