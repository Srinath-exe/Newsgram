import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/constants/constants.dart';

class OvalCard extends StatefulWidget {
  const OvalCard({super.key});

  @override
  State<OvalCard> createState() => _OvalCardState();
}

class _OvalCardState extends State<OvalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      decoration:
          BoxDecoration(color: black, borderRadius: BorderRadius.circular(40)),
    );
  }
}
