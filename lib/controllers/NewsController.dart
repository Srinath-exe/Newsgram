import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
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
// Map<String, List<NewsArticleModel>> finLis;
  var isSearchLoading = true.obs;
  var isSearch = false.obs;
  var searchNewsArticles = <SearchNewsArticleList>[].obs;
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

  void searchNews({required String search}) async {
    isSearchLoading.value = true;
    if (search == "") {
      isSearch.value = false;
    } else {
      isSearch.value = true;
    }

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
    }
    isLoading.value = false;
  }

  void fetchTechNews() async {
    var news = await NewsRepository().getNews(tag: "technology");
    if (news != []) {
      technology.value = news;
      allnews.add(news);
      // finLis.addAll({"technology": news});

      log("technology got it ");
    }
  }

  void fetchScienceNews() async {
    var news = await NewsRepository().getNews(tag: "science");
    if (news != []) {
      science.value = news;
      allnews.add(news);
      // finLis.addAll({"science": news});
      log("science got it ");
    }
  }

  void fetchSportsNews() async {
    var news = await NewsRepository().getNews(tag: "sports");
    if (news != []) {
      sports.value = news;
      allnews.add(news);
      // finLis.addAll({"sports": news});
      log("sports got it ");
    }
  }

  void fetchWorldNews() async {
    var news = await NewsRepository().getNews(tag: "movies");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"movies": news});
      log("movies got it ");
    }
  }

  void fetchPoliticalNews() async {
    var news = await NewsRepository().getNews(tag: "politics");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"politics": news});
      log("politics got it ");
    }
  }

  void fetchTravelNews() async {
    var news = await NewsRepository().getNews(tag: "travel");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"travel": news});
      log("travel got it ");
    }
  }

  void fetchCarNews() async {
    var news = await NewsRepository().getNews(tag: "automobiles");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"automobiles": news});
      log("automobile got it ");
    }
  }

  void fetchBusinessNews() async {
    var news = await NewsRepository().getNews(tag: "business");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"business": news});

      log("business got it ");
    }
  }

  void fetchFoodNews() async {
    var news = await NewsRepository().getNews(tag: "food");
    if (news != []) {
      world.value = news;
      allnews.add(news);
      // finLis.addAll({"food": news});
      log("food got it ");
    }
  }
}
