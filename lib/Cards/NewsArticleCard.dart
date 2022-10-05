import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Models/NewsModel.dart';

class NewsArticleCard extends StatefulWidget {
  NewsArticleModel news;
  NewsArticleCard({super.key, required this.news});

  @override
  State<NewsArticleCard> createState() => _NewsArticleCardState();
}

class _NewsArticleCardState extends State<NewsArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(widget.news.multimedia[0].url)),
              Column(
                children: [
                  Text(
                    widget.news.title,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
