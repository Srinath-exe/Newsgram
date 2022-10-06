import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var homeNewsArticles = <NewsArticleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeNews();
  }

  void fetchHomeNews() async {
    var news = await NewsRepository().getNews();
    if (news != []) {
      homeNewsArticles.value = news;
    }
  }
}
