import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Cards/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeNewsCard extends StatefulWidget {
  NewsArticleModel news;
  HomeNewsCard({super.key, required this.news});

  @override
  State<HomeNewsCard> createState() => _HomeNewsCardState();
}

class _HomeNewsCardState extends State<HomeNewsCard> {
  TextStyle mainstyle = TextStyle(
      fontSize: 24,
      letterSpacing: 0.6,
      // fontWeight: FontWeight.w500,
      color: white);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: Config().deviceHeight(context) * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.news.multimedia[0].url))),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              bottom: 0,
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
                  borderRadius: BorderRadius.circular(30),
                ),
                width: Config().deviceWidth(context) * 0.85,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        widget.news.title,
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
                                  "${capitalize(widget.news.section)}  •  ${capitalize(widget.news.subsection)}",
                                  style: mainstyle.copyWith(
                                    fontSize: 16,
                                    // color: white.withOpacity(0.9),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              timeago.format(widget.news.createdDate),
                              style: mainstyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Wrap(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       widget.news.byline,
                      //       style: mainstyle.copyWith(
                      //           fontSize: 13, fontWeight: FontWeight.w300
                      //           // color: white.withOpacity(0.9),
                      //           ),
                      //     )
                      //   ],
                      // )
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
