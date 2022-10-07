import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
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
    fetchTechNews();
    fetchScienceNews();
    fetchSportsNews();
    fetchWorldNews();
  }

  void fetchHomeNews() async {
    var news = await NewsRepository().getNews();
    if (news != []) {
      homeNewsArticles.value = news;
    }
  }

  void fetchTechNews() async {
    var news = await NewsRepository().getNews(tag: "technology");
    if (news != []) {
      technology.value = news;
      allnews.add(news);
    }
  }

  void fetchScienceNews() async {
    var news = await NewsRepository().getNews(tag: "science");
    if (news != []) {
      science.value = news;
      allnews.add(news);
    }
  }

  void fetchSportsNews() async {
    var news = await NewsRepository().getNews(tag: "sports");
    if (news != []) {
      sports.value = news;
      allnews.add(news);
    }
  }

  void fetchWorldNews() async {
    var news = await NewsRepository().getNews(tag: "world");
    if (news != []) {
      world.value = news;
      allnews.add(news);
    }
  }
}
