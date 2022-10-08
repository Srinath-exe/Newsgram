import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/HomeScreen/HomeScreen.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/controllers/SearchNewsController.dart';
import 'package:news_app/movies/MovieScreen.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../news/NewsScreen.dart';

class MainPage extends StatefulWidget {
  int? index;
  MainPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final NewsController newsController = Get.put(NewsController());
  final MovieController movieController = Get.put(MovieController());
  late int currentindex;

  late List pages;
  @override
  void initState() {
    currentindex = widget.index!;
    super.initState();
    pages = [
      const HomeScreen(),
      const NewsScreen(),
      const MovieScreen(),
    ];
  }

  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Config().deviceHeight(context),
        child: pages[currentindex],
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: black,
        bottomPadding: 20,
        waterDropColor: secondary,
        onItemSelected: (int index) {
          setState(() {
            currentindex = index;
          });
        },
        selectedIndex: currentindex,
        barItems: <BarItem>[
          BarItem(
            filledIcon: Icons.dashboard_rounded,
            outlinedIcon: Icons.dashboard_outlined,
          ),
          BarItem(
              filledIcon: Icons.article_rounded,
              outlinedIcon: Icons.newspaper_rounded),
          BarItem(
            filledIcon: Icons.movie_rounded,
            outlinedIcon: Icons.movie_outlined,
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem navItem({
  required int index,
  required int currentIndex,
  required String name,
}) {
  return BottomNavigationBarItem(
    icon: Container(
      height: 40,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              // SvgIcon(
              //     color: currentIndex == index ? darkGreen : Colors.grey,
              //     path: "${name}.svg"),
            ],
          ),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              bottom: currentIndex == index ? -24 : -50,
              child: Image.asset(
                "assets/images/navbottom.png",
                width: 36,
              ))
        ],
      ),
    ),
    label: name,
  );
}
