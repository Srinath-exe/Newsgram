import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var allnewsload = true.obs;
  var isworld = true.obs;
  var homeNewsArticles = <NewsArticleModel>[].obs;
  var technology = <NewsArticleModel>[].obs;
  var business = <NewsArticleModel>[].obs;
  var sports = <NewsArticleModel>[].obs;
  var science = <NewsArticleModel>[].obs;
  var world = <NewsArticleModel>[].obs;
  var allnews = <List<NewsArticleModel>>[].obs;
  Map<String, List<NewsArticleModel>> finLis = {"sample": []};
  var isSearchLoading = true.obs;
  var isSearch = false.obs;
  var searchNewsArticles = <SearchNewsArticleList>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchHomeNews();
    getall();
    finLis.removeWhere((key, value) => key == "sample");
  }

  void getall() async {
    allnewsload.value = true;

    fetchTechNews();
    fetchScienceNews();
    fetchSportsNews();
    fetchWorldNews();
    fetchPoliticalNews();
    fetchTravelNews();
    fetchCarNews();
    fetchBusinessNews();
  }

  void onreload() {
    allnewsload.value = true;
    isLoading.value = true;
    allnews.clear();
    homeNewsArticles.clear();
    fetchHomeNews();
    fetchTechNews();
    fetchScienceNews();
    fetchSportsNews();
    fetchMoviesNews();
    fetchPoliticalNews();
    fetchTravelNews();
    fetchCarNews();
    fetchBusinessNews();
  }

  void searchNews({required String search}) async {
    if (search == "") {
      isSearch.value = false;
      isSearchLoading.value = false;
    } else {
      isSearch.value = true;
    }
    isSearchLoading.value = true;

    var news = await NewsRepository().searchNews(search: search);
    if (news != []) {
      searchNewsArticles.value = news;
      isSearchLoading.value = false;
    }
    log("Fetched Search");
    log(searchNewsArticles.length.toString());
  }

  void fetchHomeNews() async {
    isLoading.value = true;
    var news = await NewsRepository().getNews(tag: "home");
    if (news != []) {
      homeNewsArticles.value = news;
      // finLis["home"] = news;
    }
    isLoading.value = false;
  }

  void fetchTechNews() async {
    var news = await NewsRepository().getNews(tag: "technology");
    if (news != []) {
      technology.value = news;
      allnews.add(news);
      finLis["technology"] = news;

      log("technology got it ");
    }
  }

  void fetchScienceNews() async {
    var news = await NewsRepository().getNews(tag: "science");
    if (news != []) {
      science.value = news;
      allnews.add(news);
      finLis["science"] = news;
      log("science got it ");
    }
  }

  void fetchSportsNews() async {
    var news = await NewsRepository().getNews(tag: "sports");
    if (news != []) {
      sports.value = news;
      allnews.add(news);
      finLis["sports"] = news;
      log("sports got it ");
    }
  }

  void fetchWorldNews() async {
    isworld.value = true;
    var news = await NewsRepository().getNews(tag: "world");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["world"] = news;
      log("World got it ");
      isworld.value = false;
    }
  }

  void fetchMoviesNews() async {
    var news = await NewsRepository().getNews(tag: "movies");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["movies"] = news;
      log("movies got it ");
    }
  }

  void fetchPoliticalNews() async {
    var news = await NewsRepository().getNews(tag: "politics");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["politics"] = news;
      log("politics got it ");
    }
  }

  void fetchTravelNews() async {
    var news = await NewsRepository().getNews(tag: "travel");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["travel"] = news;
      log("travel got it ");
    }
  }

  void fetchCarNews() async {
    var news = await NewsRepository().getNews(tag: "automobiles");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["automobiles"] = news;
      log("automobile got it ");
    }
  }

  void fetchBusinessNews() async {
    var news = await NewsRepository().getNews(tag: "business");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      finLis["business"] = news;

      log("business got it ");
    }
  }
}
