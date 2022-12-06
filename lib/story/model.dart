class TopicStoryNews {
  String title;
  String imgUrl;

  TopicStoryNews({required this.imgUrl, required this.title});
}

List<TopicStoryNews> topicList = [
  TopicStoryNews(title: "technology", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "science", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "sports", imgUrl: "assets/images/technology.png"),
  TopicStoryNews(title: "movies", imgUrl: "assets/images/technology.png"),
];

String imgs({required String tag}) {
  if (tag == "technology") {
    return "assets/images/technology.png";
  } else if (tag == "science") {
    return "assets/images/science.png";
  } else if (tag == "sports") {
    return "assets/images/sports.png";
  } else if (tag == "movies") {
    return "assets/images/movies.png";
  } else if (tag == "business") {
    return "assets/images/business.png";
  } else if (tag == "politics") {
    return "assets/images/politics.png";
  } else if (tag == "food") {
    return "assets/images/food.png";
  } else if (tag == "movies") {
    return "assets/images/movies.png";
  } else if (tag == "travel") {
    return "assets/images/travel.png";
  } else if (tag == "automobiles") {
    return "assets/images/automobiles.png";
  } else if (tag == "world") {
    return "assets/images/world.png";
  } else {
    return "assets/images/news.png";
  }
}
