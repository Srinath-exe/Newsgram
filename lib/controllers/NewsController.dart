import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var allnewsload = true.obs;
  var isworld = true.obs;
  var isDeafult = true.obs;
  var index = 0.obs;
  var homeNewsArticles = <NewsArticleModel>[].obs;
  var technology = <NewsArticleModel>[].obs;
  var business = <NewsArticleModel>[].obs;
  var sports = <NewsArticleModel>[].obs;
  var science = <NewsArticleModel>[].obs;
  var world = <NewsArticleModel>[].obs;
  var movie = <NewsArticleModel>[].obs;
  var politics = <NewsArticleModel>[].obs;
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

    while (homeNewsArticles.isEmpty) {
      homeNewsArticles.value = await NewsRepository().getNews(tag: "home");
    }

    isLoading.value = false;
  }

  void fetchTechNews() async {
    while (technology.isEmpty) {
      technology.value = await NewsRepository().getNews(tag: "technology");
    }

    allnews.add(technology.value);
    finLis["technology"] = technology.value;
    log("technology got it ");
  }

  void fetchScienceNews() async {
    while (science.isEmpty) {
      science.value = await NewsRepository().getNews(tag: "science");
    }
    allnews.add(science);
    finLis["science"] = science;
    log("science got it ");
  }

  void fetchSportsNews() async {
    while (sports.isEmpty) {
      sports.value = await NewsRepository().getNews(tag: "sports");
    }
    allnews.add(sports);
    finLis["sports"] = sports;
    log("sports got it ");
  }

  void fetchWorldNews() async {
    isworld.value = true;
    while (world.isEmpty) {
      world.value = await NewsRepository().getNews(tag: "world");
    }

    allnews.add(world);
    finLis["world"] = world;
    log("World got it ");
    log(world.value[0].toString());
    isworld.value = false;
  }

  void fetchMoviesNews() async {
    while (movie.isEmpty) {
      movie.value = await NewsRepository().getNews(tag: "movies");
    }

    allnews.add(movie);
    finLis["movies"] = movie;
    log("movies got it ");
  }

  void fetchPoliticalNews() async {
    while (politics.isEmpty) {
      politics.value = await NewsRepository().getNews(tag: "politics");
    }

    allnews.add(politics);
    finLis["politics"] = politics;
    log("politics got it ");
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
    List<NewsArticleModel> news = [];
    while (news.isEmpty) {
      news = await NewsRepository().getNews(tag: "automobiles");
    }

    allnews.add(news);
    finLis["automobiles"] = news;
    log("automobile got it ");
  }

  void fetchBusinessNews() async {
    List<NewsArticleModel> news = [];
    while (news.isEmpty) {
      news = await NewsRepository().getNews(tag: "business");
    }

    allnews.add(news);
    finLis["business"] = news;

    log("business got it ");
  }
}
