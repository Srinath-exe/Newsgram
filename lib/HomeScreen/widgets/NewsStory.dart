import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewsStory extends StatefulWidget {
  const NewsStory({super.key});

  @override
  State<NewsStory> createState() => _NewsStoryState();
}

class _NewsStoryState extends State<NewsStory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }

  story() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        ),
      ],
    );
  }
}
