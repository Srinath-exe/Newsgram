// To parse this JSON data, do
//
//     final reviewsModel = reviewsModelFromJson(jsonString);

import 'dart:convert';

var defa = MovieModel.fromJson(
  {
    "display_title": "Captain Marvel",
    "mpaa_rating": "PG-13",
    "critics_pick": 0,
    "byline": "A.O. SCOTT",
    "headline": "‘Captain Marvel’ Review: Brie Larson Takes a Trip to the ’90s",
    "summary_short":
        "The newest member of the Marvel Cinematic Universe goes on a nostalgia trip in the company of Samuel L. Jackson and Annette Bening.",
    "publication_date": "2019-03-05",
    "opening_date": "2019-03-08",
    "date_updated": "2019-04-05 16:44:01",
    "link": {
      "type": "article",
      "url":
          "https://www.nytimes.com/2019/03/05/movies/captain-marvel-review.html",
      "suggested_link_text": "Read the New York Times Review of Captain Marvel"
    },
    "multimedia": {
      "type": "mediumThreeByTwo210",
      "src":
          "https://static01.nyt.com/images/2019/03/05/arts/05captainmarvel/05captainmarvel-mediumThreeByTwo210-v2.jpg",
      "height": 140,
      "width": 210
    }
  },
);

ReviewsModel reviewsModelFromJson(String str) =>
    ReviewsModel.fromJson(json.decode(str));

String reviewsModelToJson(ReviewsModel data) => json.encode(data.toJson());

class ReviewsModel {
  ReviewsModel({
    required this.status,
    required this.copyright,
    required this.hasMore,
    required this.numResults,
    this.results,
  });

  String status;
  String copyright;
  bool hasMore;
  int numResults;
  List<MovieModel>? results = [defa];

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => ReviewsModel(
        status: json["status"],
        copyright: json["copyright"],
        hasMore: json["has_more"],
        numResults: json["num_results"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "has_more": hasMore,
        "num_results": numResults,
        // "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class MovieModel {
  MovieModel({
    required this.displayTitle,
    required this.mpaaRating,
    required this.criticsPick,
    required this.byline,
    required this.headline,
    required this.summaryShort,
    required this.publicationDate,
    required this.openingDate,
    required this.dateUpdated,
    required this.link,
    this.multimedia,
  });

  String displayTitle;
  String mpaaRating;
  int criticsPick;
  String byline;
  String headline;
  String summaryShort;
  String publicationDate;
  String openingDate;
  String dateUpdated;
  Link link;
  Multimedia? multimedia =
      Multimedia(type: "wtf", src: "", height: 140, width: 400);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        displayTitle: json["display_title"],
        mpaaRating: json["mpaa_rating"],
        criticsPick: json["critics_pick"],
        byline: json["byline"],
        headline: json["headline"],
        summaryShort: json["summary_short"],
        publicationDate: json["publication_date"],
        openingDate: json["opening_date"] ?? "",
        dateUpdated: json["date_updated"],
        link: Link.fromJson(json["link"]),
        multimedia: Multimedia.fromJson(json["multimedia"]),
      );

  Map<String, dynamic> toJson() => {
        "display_title": displayTitle,
        "mpaa_rating": mpaaRating,
        "critics_pick": criticsPick,
        "byline": byline,
        "headline": headline,
        "summary_short": summaryShort,
        "publication_date": publicationDate,
        "opening_date": openingDate,
        "date_updated": dateUpdated,
        "link": link.toJson(),
        // "multimedia": multimedia.toJson(),
      };
}

class Link {
  Link({
    this.type = "",
    required this.url,
    this.suggestedLinkText = "",
  });

  String? type;
  String url;
  String? suggestedLinkText;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        // type: json["type"],
        url: json["url"],
        // suggestedLinkText: json["suggested_link_text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "suggested_link_text": suggestedLinkText,
      };
}

class Multimedia {
  Multimedia({
    this.type = "ok",
    required this.src,
    required this.height,
    required this.width,
  });

  String? type;
  String src;
  int height;
  int width;

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        type: json["type"],
        src: json["src"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "src": src,
        "height": height,
        "width": width,
      };
}
