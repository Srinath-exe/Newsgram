import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var allnewsload = true.obs;
  var homeNewsArticles = <NewsArticleModel>[].obs;
  var technology = <NewsArticleModel>[].obs;
  var business = <NewsArticleModel>[].obs;
  var sports = <NewsArticleModel>[].obs;
  var science = <NewsArticleModel>[].obs;
  var world = <NewsArticleModel>[].obs;
  var allnews = <List<NewsArticleModel>>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchHomeNews();
    // getall();
  }

  void getall() {
    allnewsload.value = true;
    fetchTechNews();
    fetchScienceNews();
    fetchSportsNews();
    fetchWorldNews();
    fetchPoliticalNews();
    fetchTravelNews();
    fetchCarNews();
    fetchBusinessNews();
    allnewsload.value = false;
  }

  void fetchHomeNews() async {
    var news = await NewsRepository().getNews(tag: "home");
    if (news != []) {
      homeNewsArticles.value = news;
    }
  }

  void fetchTechNews() async {
    var news = await NewsRepository().getNews(tag: "technology");
    if (news != []) {
      technology.value = news;
      allnews.add(news);

      print("technology got it ");
    }
  }

  void fetchScienceNews() async {
    var news = await NewsRepository().getNews(tag: "science");
    if (news != []) {
      science.value = news;
      allnews.add(news);
      print("science got it ");
    }
  }

  void fetchSportsNews() async {
    var news = await NewsRepository().getNews(tag: "sports");
    if (news != []) {
      sports.value = news;
      allnews.add(news);
      print("sports got it ");
    }
  }

  void fetchWorldNews() async {
    var news = await NewsRepository().getNews(tag: "movies");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("movies got it ");
    }
  }

  void fetchPoliticalNews() async {
    var news = await NewsRepository().getNews(tag: "politics");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("politics got it ");
    }
  }

  void fetchTravelNews() async {
    var news = await NewsRepository().getNews(tag: "travel");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("travel got it ");
    }
  }

  void fetchCarNews() async {
    var news = await NewsRepository().getNews(tag: "automobile");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("automobile got it ");
    }
  }

  void fetchBusinessNews() async {
    var news = await NewsRepository().getNews(tag: "business");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("business got it ");
    }
  }

  void fetchFoodNews() async {
    var news = await NewsRepository().getNews(tag: "food");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      print("food got it ");
    }
  }
}
