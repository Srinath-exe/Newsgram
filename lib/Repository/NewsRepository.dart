// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/Repository/Repository..dart';
import 'package:news_app/constants/constants.dart';

class NewsRepository {
  Future<List<NewsArticleModel>> getNews({String tag = "home"}) async {
    final response = await API.get(
        url:
            'https://api.nytimes.com/svc/topstories/v2/${tag}.json?api-key=${APIKEY}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      if (res["results"] == null) {
        return [];
      }
      List<NewsArticleModel> lis = [];
      List.generate(
          res["num_results"],
          (index) => {
                if (res["results"][index]["multimedia"] != null &&
                    res["results"][index]["section"] != null &&
                    res["results"][index]["byline"] != null &&
                    res["results"][index]["title"] != null &&
                    res["results"][index]["abstract"] != null &&
                    res["results"][index]["des_facet"] != null &&
                    res["results"][index]["abstract"] != null)
                  {lis.add(NewsArticleModel.fromJson(res["results"][index]))}
              });

      return lis;
    } else {
      return [];
    }
  }

  Future<List<SearchNewsArticleList>> searchNews(
      {required String search}) async {
    final response = await API.get(
        url:
            'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=${search}&api-key=${APIKEY}');
    log(response.body);
    if (response.statusCode == 200 && response.statusCode == 201) {
      final searchNewsList = searchNewsModelFromJson(response.body);
      return searchNewsList.searchNewsArticle.searchNewsArticleList;
    } else {
      return [];
    }
  }
}
