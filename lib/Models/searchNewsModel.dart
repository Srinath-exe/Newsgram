import 'dart:convert';

SearchNewsModel searchNewsModelFromJson(String str) =>
    SearchNewsModel.fromJson(json.decode(str));

String searchNewsModelToJson(SearchNewsModel data) =>
    json.encode(data.toJson());

class SearchNewsModel {
  SearchNewsModel({
    required this.status,
    required this.copyright,
    required this.searchNewsArticle,
  });

  String status;
  String copyright;
  SearchNewsArticle searchNewsArticle;

  factory SearchNewsModel.fromJson(Map<String, dynamic> json) =>
      SearchNewsModel(
        status: json["status"],
        copyright: json["copyright"],
        searchNewsArticle:
            SearchNewsArticle.fromJson(json["searchNewsArticle"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "searchNewsArticle": searchNewsArticle.toJson(),
      };
}

class SearchNewsArticle {
  SearchNewsArticle({
    required this.searchNewsArticleList,
  });

  List<SearchNewsArticleList> searchNewsArticleList;

  factory SearchNewsArticle.fromJson(Map<String, dynamic> json) =>
      SearchNewsArticle(
        searchNewsArticleList: List<SearchNewsArticleList>.from(
            json["docs"].map((x) => SearchNewsArticleList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "docs":
            List<dynamic>.from(searchNewsArticleList.map((x) => x.toJson())),
      };
}

class SearchNewsArticleList {
  SearchNewsArticleList({
    required this.docAbstract,
    required this.webUrl,
    required this.snippet,
    required this.leadParagraph,
    required this.multimedia,
    required this.headline,
    required this.pubDate,
    required this.newsDesk,
    required this.sectionName,
    required this.subsectionName,
    required this.byline,
    required this.id,
    required this.wordCount,
    required this.uri,
  });

  String docAbstract;
  String webUrl;
  String snippet;
  String leadParagraph;

  List<SearchNewsMultimedia> multimedia;
  Headline headline;
  String pubDate;
  String newsDesk;
  String sectionName;
  String subsectionName;
  Byline byline;
  String id;
  int wordCount;
  String uri;

  factory SearchNewsArticleList.fromJson(Map<String, dynamic> json) =>
      SearchNewsArticleList(
        docAbstract: json["abstract"],
        webUrl: json["web_url"],
        snippet: json["snippet"],
        leadParagraph: json["lead_paragraph"],
        multimedia: List<SearchNewsMultimedia>.from(
            json["multimedia"].map((x) => SearchNewsMultimedia.fromJson(x))),
        headline: Headline.fromJson(json["headline"]),
        pubDate: json["pub_date"],
        newsDesk: json["news_desk"],
        sectionName: json["section_name"],
        subsectionName: json["subsection_name"] ?? "null",
        byline: Byline.fromJson(json["byline"]),
        id: json["_id"],
        wordCount: json["word_count"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "abstract": docAbstract,
        "web_url": webUrl,
        "snippet": snippet,
        "lead_paragraph": leadParagraph,
        "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
        "headline": headline.toJson(),
        "pub_date": pubDate,
        "news_desk": newsDesk,
        "section_name": sectionName,
        "subsection_name": subsectionName,
        "byline": byline.toJson(),
        "_id": id,
        "word_count": wordCount,
        "uri": uri,
      };
}

class Byline {
  Byline({
    required this.original,
  });

  String original;

  factory Byline.fromJson(Map<String, dynamic> json) => Byline(
        original: json["original"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
      };
}

class Headline {
  Headline({
    required this.main,
    required this.printHeadline,
  });

  String main;
  String printHeadline;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        main: json["main"],
        printHeadline: json["print_headline"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "print_headline": printHeadline,
      };
}

class SearchNewsMultimedia {
  SearchNewsMultimedia({
    required this.rank,
    required this.caption,
    required this.url,
    required this.type,
    required this.height,
    required this.width,
    required this.cropName,
  });

  int rank;

  dynamic caption;
  dynamic credit;
  String type;
  String url;
  int height;
  int width;
  String cropName;

  factory SearchNewsMultimedia.fromJson(Map<String, dynamic> json) =>
      SearchNewsMultimedia(
        rank: json["rank"],
        caption: json["caption"],
        type: json["type"],
        url: json["url"] ?? "",
        height: json["height"],
        width: json["width"],
        cropName: json["crop_name"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "caption": caption,
        "credit": credit,
        "type": type,
        "url": url,
        "height": height,
        "width": width,
        "crop_name": cropName,
      };
}
