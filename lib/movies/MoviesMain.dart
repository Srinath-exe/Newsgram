import 'package:flutter/material.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/movies/OvalCard.dart';

class MoviesMain extends StatefulWidget {
  const MoviesMain({super.key});

  @override
  State<MoviesMain> createState() => _MoviesMainState();
}

class _MoviesMainState extends State<MoviesMain> {
  late int _currentPage;
  late PageController _pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OvalCard()
        // PageView.builder(
        //     controller: _pageController,
        //     scrollDirection: Axis.vertical,
        //     itemCount: newList.length + 1,
        //     itemBuilder: (context, index) {
        //       if (index == 0) {
        //         return const SizedBox.shrink();
        //       }
        //       return OvalCard();
        //     }),
        );
  }
}
