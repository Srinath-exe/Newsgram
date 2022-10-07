import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/story/model.dart';
import 'package:timeago/timeago.dart' as timeago;

class TopicStory extends StatefulWidget {
  TopicStoryNews topic;
  List<NewsArticleModel> newslist;
  TopicStory({super.key, required this.topic, required this.newslist});

  @override
  State<TopicStory> createState() => _TopicStoryState();
}

class _TopicStoryState extends State<TopicStory> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: Config().deviceHeight(context) * 0.9,
        child: PageView(
      physics: ClampingScrollPhysics(),
      children: List.generate(
          widget.newslist.length, (index) => view(widget.newslist[index])),
    ));
  }

  view(NewsArticleModel news) {
    TextStyle mainstyle = TextStyle(
        fontSize: 24,
        letterSpacing: 0.6,
        // fontWeight: FontWeight.w500,
        color: white);
    return Material(
      child: Container(
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
                        black.withOpacity(0.1),
                        black.withOpacity(0.2),
                        black.withOpacity(0.3),
                        black.withOpacity(0.3),
                      ]),
                  // borderRadius: BorderRadius.circular(50),
                ),
                width: Config().deviceWidth(context) * 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        news.title,
                        style: mainstyle.copyWith(
                            letterSpacing: 1, fontWeight: FontWeight.w600),
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            news.byline,
                            style: mainstyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w300
                                // color: white.withOpacity(0.9),
                                ),
                          )
                        ],
                      )
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
}
