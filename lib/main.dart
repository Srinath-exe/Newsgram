import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/MainScreen/mainPage.dart';
import 'package:news_app/Models/f.dart';
import 'package:news_app/controllers/MovieController.dart';
import 'package:news_app/controllers/NewsController.dart';
import 'package:news_app/movies/MovieScreen.dart';
import 'package:news_app/movies/MoviesMain.dart';
import 'package:news_app/story/TopicStory.dart';
import 'package:news_app/story/model.dart';
import 'package:news_app/yeeppi.dart';

import 'HomeScreen/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        platform: TargetPlatform.iOS,
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: MainPage(
        index: 2,
      ),
    );
  }
}
