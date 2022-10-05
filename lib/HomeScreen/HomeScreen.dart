import 'package:flutter/material.dart';
import 'package:news_app/Cards/HomeNewsCard.dart';
import 'package:news_app/Cards/NewsArticleCard.dart';
import 'package:news_app/HomeScreen/widgets/homeNewscards.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';
import 'package:news_app/bloc/newsBloc.dart';
import 'package:news_app/constants/constants.dart';

import '../Models/f.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Treks",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: black),
                  ),
                ],
              ),
            ),
            HomeNewsCards(),
            NewsArticleCard(
              news: newsArt,
            ),
            NewsArticleCard(
              news: newsArt,
            )
            // Container(
            //   height: 500,
            //   child: FutureBuilder<List<NewsArticleModel>>(
            //     future: NewsRepository().getNews(context: context),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return CircularProgressIndicator();
            //       }
            //       return CircleAvatar();
            //     },
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
