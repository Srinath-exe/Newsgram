import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:news_app/Models/MoviesModel.dart';
import 'package:news_app/constants/HeroWidget.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/constants/stars.dart';

import '../Models/MovieDetailsModel.dart';

class MovieDetailsScreen extends StatefulWidget {
  MoviesDetailsModel movie;
  MoviesModel m1;
  MovieDetailsScreen({super.key, required this.movie, required this.m1});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.movie.posterPath,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: imagebaseULR + widget.movie.posterPath,
                  width: Config().deviceWidth(context),
                  // height: Config().deviceHeight(context) * 0.22,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) => Lottie.asset(
                      'assets/lottie/newsload.json',
                      width: 80,
                      reverse: false,
                      repeat: false),
                ),
              ),
            ),
            HeroWidget(
              tag: widget.movie.title,
              child: Container(
                width: Config().deviceWidth(context),
                // height: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.m1.title,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      widget.m1.voteAverage.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            IconTheme(
              data: const IconThemeData(
                color: Colors.amber,
                size: 48,
              ),
              child: StarDisplay(value: (widget.movie.voteAverage / 2).toInt()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.movie.genres.length,
                  (index) => chips(widget.movie.genres[index])),
            ),
            title("Overview"),
            title(widget.movie.overview),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      infoUI(
                        "Revenue",
                        MoneyFormatter(
                          amount: widget.movie.revenue == 0
                              ? 10000000
                              : widget.movie.revenue.toDouble(),
                        ).output.compactSymbolOnLeft,
                      ),
                      infoUI(
                        "Budget",
                        MoneyFormatter(
                          amount: widget.movie.budget.toDouble(),
                        ).output.compactSymbolOnLeft,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      infoUI(
                          "Release Date",
                          formatDate(
                              DateTime(1989, 2, 21), [d, ' ', M, '\' ', yy])),
                      infoUI(
                          "Runtime", widget.movie.runtime.toString() + " min"),
                    ],
                  ),
                ],
              ),
            ),

            //             "release_date": "1999-10-12",
            // "revenue": 100853753,
            // "runtime": 139,
            title("Production Companies"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.movie.productionCompanies.length,
                  (index) {
                if (widget.movie.productionCompanies[index].logoPath != null) {
                  return productionCompany(
                      widget.movie.productionCompanies[index]);
                }
                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }

  chips(Genre genre) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        backgroundColor: Colors.transparent,
        shape: const StadiumBorder(side: BorderSide()),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
        label: Text(
          genre.name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  title(String txt, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Wrap(
        children: [
          Text(
            txt,
            style: style == null
                ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                : style,
          ),
        ],
      ),
    );
  }

  productionCompany(ProductionCompany comp) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: imagebaseULR + comp.logoPath,
                width: 60,
                height: 60,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => Lottie.asset(
                    'assets/lottie/newsload.json',
                    width: 80,
                    reverse: false,
                    repeat: false),
              ),
            ),
            Text(
              comp.name,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  infoUI(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Config().deviceWidth(context) * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
