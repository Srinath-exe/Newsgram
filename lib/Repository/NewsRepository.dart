// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/Repository/Repository..dart';
import 'package:news_app/constants/constants.dart';

class NewsRepository {
  Future<List<NewsArticleModel>> getNews(
      {String tag = "home", required BuildContext context}) async {
    final response = await API.get(
        context: context,
        url:
            'https://api.nytimes.com/svc/topstories/v2/${tag}.json?api-key=${APIKEY}');
    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final newsList = newsModelFromJson(response.body);
      return newsList.newsArticles;
    } else {
      return [];
    }
  }

  Future<List<SearchNewsArticleList>> searchNews(
      {required String search, required BuildContext context}) async {
    final response = await API.get(
        context: context,
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
