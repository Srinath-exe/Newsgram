import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/story/model.dart';
import 'package:timeago/timeago.dart' as timeago;

class TopicStory extends StatefulWidget {
  List<NewsArticleModel> newslist;
  Function(bool) onNext;
  TopicStory({super.key, required this.newslist, required this.onNext});

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
            print(currentPage);
            print(widget.newslist.length);
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage(
                            imgs(tag: widget.newslist[currentPage].section),
                          ),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.newslist[currentPage].section,
                    style: mainstyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  view(
    NewsArticleModel news,
  ) {
    return Material(
      child: Container(
        height: Config().deviceHeight(context) * 0.5,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(news.multimedia[0].url),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.hardEdge,
          children: [
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
