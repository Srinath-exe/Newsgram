import 'package:flutter/material.dart';
import 'package:news_app/constants/constants.dart';

class MainPage extends StatefulWidget {
  int? index;
  MainPage({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentindex;
  // final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  late List pages;
  @override
  void initState() {
    currentindex = widget.index!;
    super.initState();
    pages = [
      CircleAvatar(),
      CircleAvatar(),
      CircleAvatar(), CircleAvatar()
      // HomeScreen(
      //   onTap: () {
      //     final _state = _sideMenuKey.currentState;
      //     if (_state!.isOpened) {
      //       _state.closeSideMenu();
      //     } else {
      //       _state.openSideMenu();
      //     } // open side menu
      //   },
      // ),
      // const SearchScreen(),
      // const NewsScreen(),
      // const ProfileScreen(),
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
        child: Stack(
          children: [
            Container(
              height: Config().deviceHeight(context),
              child: pages[currentindex],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: Config().deviceWidth(context),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Material(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Colors.transparent,
                    clipBehavior: Clip.hardEdge,
                    child: BottomNavigationBar(
                      currentIndex: currentindex,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.green,
                      unselectedItemColor: Colors.grey.withOpacity(0.5),
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      elevation: 0,
                      onTap: onTap,
                      items: [
                        navItem(
                            currentIndex: currentindex, index: 0, name: "home"),
                        navItem(
                            currentIndex: currentindex,
                            index: 1,
                            name: "search"),
                        navItem(
                            currentIndex: currentindex, index: 2, name: "news"),
                        navItem(
                            currentIndex: currentindex,
                            index: 3,
                            name: "profile"),
                      ],
                    ),
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
              SizedBox(
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
