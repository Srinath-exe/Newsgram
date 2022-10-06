import 'package:get/get.dart';
import 'package:news_app/Models/NewsModel.dart';
import 'package:news_app/Models/searchNewsModel.dart';
import 'package:news_app/Repository/NewsRepository.dart';

class SearchNewsController extends GetxController {
  var isLoading = true.obs;
  var searchNewsArticles = <SearchNewsArticleList>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void searchNews({required String search}) async {
    var news = await NewsRepository().searchNews(search: search);
    if (news != []) {
      searchNewsArticles.value = news;
    }
  }
}
