import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/Models/ReviewsModel.dart';
import 'package:news_app/constants/constants.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:timeago/timeago.dart' as timeago;

class MovieCard extends StatefulWidget {
  MovieModel movie;
  MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ZoomTapAnimation(
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: [
                Column(children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.network(
                      widget.movie.multimedia!.src,
                      height: Config().deviceHeight(context) * 0.22,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.displayTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: black),
                    ),
                  ),
                ]),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        timeago.format(
                          DateTime.parse(widget.movie.publicationDate),
                        ),
                        style: TextStyle(color: black, fontSize: 10),
                      ),
                    ).frosted(
                        frostColor: white,
                        frostOpacity: 0.2,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
