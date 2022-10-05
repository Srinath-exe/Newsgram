import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/Repository/NewsRepository.dart';
import 'package:news_app/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../Models/NewsModel.dart';

class NewsBloc extends Bloc {
  BuildContext context;
  String tag;

  NewsBloc(this.context, this.tag) {
    getNews(tag);
  }
  final _newsArticleListController = BehaviorSubject<List<NewsArticleModel>>();
  Stream<List<NewsArticleModel>> get newsArticleStream =>
      _newsArticleListController.stream.asBroadcastStream();

  Future<bool> getNews(String tag) async {
    final result = await NewsRepository().getNews(context: context, tag: tag);
    _newsArticleListController.sink.add(result);
    return true;
  }

  @override
  void dispose() {
    _newsArticleListController.close();
  }
}

class NewsProvider extends InheritedWidget {
  late NewsBloc bloc;
  String tag;
  BuildContext context;
  NewsProvider(
      {Key? key,
      required this.tag,
      required Widget child,
      required this.context})
      : super(key: key, child: child) {
    bloc = NewsBloc(context, tag);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static NewsBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<NewsProvider>()
            as NewsProvider)
        .bloc;
  }
}
