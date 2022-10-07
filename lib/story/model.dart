import 'package:news_app/Models/NewsModel.dart';

class TopicStoryNews {
  String title;
  String imgUrl;
  // List<NewsArticleModel> news;

  TopicStoryNews({required this.imgUrl, required this.title});
}

List<TopicStoryNews> topicList = [
  TopicStoryNews(title: "technology", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "science", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "sports", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "world", imgUrl: "assets/images/technology.png")
];
