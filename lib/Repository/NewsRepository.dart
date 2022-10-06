// ignore_for_file: unnecessary_brace_in_string_interps

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
      var newsList = newsModelFromJson(response.body);
      return newsList.newsArticles;
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      final searchNewsList = searchNewsModelFromJson(response.body);
      return searchNewsList.searchNewsArticle.searchNewsArticleList;
    } else {
      return [];
    }
  }
}
