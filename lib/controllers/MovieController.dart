import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/MoviesModel.dart';
import 'package:news_app/Models/ReviewsModel.dart';
import 'package:news_app/Repository/MovieRepo.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var isSearch = false.obs;
  var moviesList = <MoviesModel>[].obs;
  var page = 20.obs;
  @override
  void onInit() {
    super.onInit();
    // fetchTopMovies();
    // fetchHomeMovies();
  }

  void fetchTopMovies() async {
    log("FETECHING STARTED");
    isLoading.value = false;
    isSearch.value = false;
    var movies = await MovieRepository().getTopRatesMovie();
    log("FETECHING ENDED");
    if (movies != []) {
      moviesList.value = movies;
      page.value++;
      isLoading.value = true;
    }
  }

  // void fetchHomeMovies() async {
  //   isLoading.value = false;
  //   isSearch.value = false;
  //   var movies = await MovieRepository().getMovie();
  //   if (movies != []) {
  //     moviesList.value = movies;
  //     page.value++;
  //     isLoading.value = true;
  //   }
  // }

  // void fetchMoreMovies() async {
  //   isLoading.value = false;
  //   isSearch.value = false;
  //   var movies = await MovieRepository().getMovie(page: page.value);
  //   if (movies != []) {
  //     moviesList.addAll(movies);
  //     moviesList.sentToStream;
  //     isLoading.value = true;
  //   }

  //   page.value = moviesList.value.length + 20;
  // }

  // void searchMovies({required String query}) async {
  //   isLoading.value = false;
  //   if (query == "") {
  //     isSearch.value = false;
  //   } else {
  //     isSearch.value = true;
  //   }
  //   var searchmovies = await MovieRepository().searchMovie(search: query);
  //   if (searchmovies != []) {
  //     moviesList.value = searchmovies;
  //     isLoading.value = true;
  //   }
  // }
}
