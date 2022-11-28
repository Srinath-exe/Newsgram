import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/constants/buttons.dart';
import 'package:news_app/constants/constants.dart';

import '../Models/MoviesModel.dart';

class OvalCard extends StatefulWidget {
  MoviesModel movie;
  OvalCard({super.key, required this.movie});

  @override
  State<OvalCard> createState() => _OvalCardState();
}

class _OvalCardState extends State<OvalCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: 300,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(maxHeight: 700, minHeight: 500),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(200)),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
              bottom: -10,
              child: ThemeButton(
                text: "See more",
                height: 80,
                borderRadius: 40,
              )),
          Container(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            imagebaseULR + widget.movie.posterPath,
                            errorListener: () {},
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.movie.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  widget.movie.voteAverage.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                // SizedBox(
                //   height: 100,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
