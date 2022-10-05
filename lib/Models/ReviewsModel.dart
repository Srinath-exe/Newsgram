// To parse this JSON data, do
//
//     final reviewsModel = reviewsModelFromJson(jsonString);

import 'dart:convert';

ReviewsModel reviewsModelFromJson(String str) =>
    ReviewsModel.fromJson(json.decode(str));

String reviewsModelToJson(ReviewsModel data) => json.encode(data.toJson());

class ReviewsModel {
  ReviewsModel({
    required this.status,
    required this.copyright,
    required this.hasMore,
    required this.numResults,
    required this.results,
  });

  String status;
  String copyright;
  bool hasMore;
  int numResults;
  List<MovieModel> results;

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
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
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
    required this.multimedia,
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
  Multimedia multimedia;

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
        "multimedia": multimedia.toJson(),
      };
}

class Link {
  Link({
    required this.type,
    required this.url,
    required this.suggestedLinkText,
  });

  String type;
  String url;
  String suggestedLinkText;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        type: json["type"],
        url: json["url"],
        suggestedLinkText: json["suggested_link_text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
        "suggested_link_text": suggestedLinkText,
      };
}

class Multimedia {
  Multimedia({
    required this.type,
    required this.src,
    required this.height,
    required this.width,
  });

  String type;
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
