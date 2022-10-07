import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/constants/constants.dart';

class TempStory extends StatefulWidget {
  const TempStory({super.key});

  @override
  State<TempStory> createState() => _TempStoryState();
}

class _TempStoryState extends State<TempStory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config().deviceHeight(context) * 0.6,
      width: Config().deviceWidth(context),
      color: Colors.amber,
    );
  }
}
