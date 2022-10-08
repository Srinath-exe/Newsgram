import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/story/model.dart';
import 'package:timeago/timeago.dart' as timeago;

class TopicStory extends StatefulWidget {
  List<NewsArticleModel> newslist;
  String title;
  Function(bool) onNext;
  TopicStory(
      {super.key,
      required this.newslist,
      required this.onNext,
      required this.title});

  @override
  State<TopicStory> createState() => _TopicStoryState();
}

class _TopicStoryState extends State<TopicStory> {
  late PageController pageController = PageController();
  int currentPage = 0;
  int storyNum = 3;
  TextStyle mainstyle = TextStyle(
      fontSize: 24,
      letterSpacing: 0.6,
      // fontWeight: FontWeight.w500,
      color: white);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (pos) {
            setState(() {
              currentPage = pos;
            });
          },
          children:
              List.generate(storyNum, (index) => view(widget.newslist[index])),
        ),
        Container(
            child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (currentPage == 0) {
                    widget.onNext(false);
                  } else {
                    pageController.previousPage(
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.linear);
                  }
                },
                child: Container(
                  color: black.withOpacity(0.001),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (currentPage == (storyNum - 1)) {
                    widget.onNext(true);
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.linear);
                  }
                },
                child: Container(
                  color: black.withOpacity(0.001),
                ),
              ),
            )
          ],
        )),
        Positioned(
          top: 20,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: black,
                      // borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                        image: AssetImage(
                          imgs(tag: widget.title),
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        capitalize(widget.title),
                        style: mainstyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        timeago
                            .format(widget.newslist[currentPage].createdDate),
                        style: mainstyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      List.generate(storyNum, (index) => div(index: index))),
            ))
      ],
    ));
  }

  div({required int index}) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        width: Config().deviceWidth(context) / 3,
        height: 2,
        decoration: BoxDecoration(
            color: index >= currentPage ? Colors.grey.shade600 : white,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  view(
    NewsArticleModel news,
  ) {
    return Material(
      color: black,
      child: Container(
        height: Config().deviceHeight(context) * 0.5,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: CachedNetworkImageProvider(news.multimedia[0].url),
        //         fit: BoxFit.cover)

        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              height: Config().deviceHeight(context),
              width: Config().deviceWidth(context),
              child: CachedNetworkImage(
                imageUrl: news.multimedia[0].url,
                fit: BoxFit.cover,
                placeholder: (context, url) => Lottie.asset(
                    'assets/lottie/newsload.json',
                    width: 400,
                    height: 600),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        black.withOpacity(0.052),
                        black.withOpacity(0.2),
                        black.withOpacity(0.4),
                        black.withOpacity(0.4),
                        black.withOpacity(0.2),
                        black.withOpacity(0.052),
                      ]),
                  // borderRadius: BorderRadius.circular(50),
                ),
                width: Config().deviceWidth(context) * 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          news.title,
                          style: mainstyle.copyWith(
                              fontSize: 32,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        news.resultAbstract,
                        style: mainstyle.copyWith(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  capitalize(news.section),
                                  style: mainstyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                                news.subsection != ""
                                    ? Text(
                                        " •  ${capitalize(news.subsection)}",
                                        style: mainstyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Text(
                              timeago.format(news.createdDate),
                              style: mainstyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        children: List.generate(
                            news.desFacet.length > 3 ? 3 : news.desFacet.length,
                            (index) => chip(tag: news.desFacet[index])),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            news.byline,
                            style: mainstyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w400
                                // color: white.withOpacity(0.9),
                                ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chip({required String tag}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(tag, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}
