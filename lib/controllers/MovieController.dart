import 'package:get/get.dart';
import 'package:news_app/Models/ReviewsModel.dart';
import 'package:news_app/Repository/movieRepository.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var moviesList = <MovieModel>[].obs;
  var page = 0.obs;
  @override
  void onInit() {
    super.onInit();

    fetchHomeMovies();
  }

  void fetchHomeMovies() async {
    var movies = await MovieRepository().getMovie();
    if (movies != []) {
      moviesList.value = movies;
      page.value++;
    }
  }

  void fetchMoreMovies() async {
    var movies = await MovieRepository().getMovie(page: page.value);
    if (movies != []) {
      moviesList.value = moviesList.value + movies;
      page.value++;
    }
  }

  void searchMovies({required String query}) async {
    var searchmovies = await MovieRepository().searchMovie(search: query);
    if (searchmovies != []) {
      moviesList.value = searchmovies;
    }
  }
}
