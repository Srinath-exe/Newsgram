import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/MovieDetailsModel.dart';
import 'package:news_app/Models/MoviesModel.dart';
import 'package:news_app/Repository/MovieDetailRepo.dart';
import 'package:news_app/Repository/MovieRepo.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var isSearch = false.obs;
  var noSearchresult = false.obs;
  var isMovieDetailLoading = false.obs;
  var hasSimilarMovie = false.obs;
  var similarMovies = <MoviesModel>[].obs;
  final movieDetail = Rxn<MoviesDetailsModel>();
  var mainMovieList = <MoviesModel>[].obs;
  var topMoviesList = <MoviesModel>[].obs;
  var carouselMoviesList = <MoviesModel>[].obs;

  var popularmoviesList = <MoviesModel>[].obs;
  var theaterMoviesList = <MoviesModel>[].obs;
  var upcomingmoviesList = <MoviesModel>[].obs;
  var page = 20.obs;
  MovieRepository movieRepo = MovieRepository();

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void getMovieDetails(String id) async {
    movieDetail.value = null;
    hasSimilarMovie = false.obs;
    similarMovies.value = [];
    isMovieDetailLoading.value = true;
    int count = 0;
    while (movieDetail.value == null) {
      count++;
      log(count.toString());
      movieDetail.value =
          await MovieDetailRepository().getMovieDetails(movie_id: id);
    }

    similarMovies.value = await movieRepo.getSimilarMovie(movie_id: id);

    if (similarMovies.isNotEmpty) {
      hasSimilarMovie = true.obs;
    }
    isMovieDetailLoading.value = false;
  }

  void fetchMovies() async {
    isLoading.value = true;
    isSearch.value = false;
    int count = 0;
    while (theaterMoviesList.isEmpty) {
      count++;
      theaterMoviesList.value = await movieRepo.getNowplayingMovie();
    }
    mainMovieList.value = theaterMoviesList;
    carouselMoviesList.value = theaterMoviesList;
    while (topMoviesList.isEmpty) {
      count++;
      topMoviesList.value = await movieRepo.getTopRatesMovie();
    }

    while (popularmoviesList.isEmpty) {
      count++;
      popularmoviesList.value = await movieRepo.getPopularMovie();
    }

    while (upcomingmoviesList.isEmpty) {
      count++;
      upcomingmoviesList.value = await movieRepo.getUpcomingMovie();
    }
    log("COUNT :  $count");
    log("FETCH COMPLETE");

    isLoading.value = false;
  }

  void showTopRelated(int id) {
    noSearchresult.value = false;
    isLoading.value = true;
    switch (id) {
      case 0:
        mainMovieList.value = theaterMoviesList;
        break;
      case 1:
        mainMovieList.value = upcomingmoviesList;
        break;
      case 2:
        mainMovieList.value = popularmoviesList;
        break;
      case 3:
        mainMovieList.value = topMoviesList;
        break;
      default:
        mainMovieList.value = theaterMoviesList;
        break;
    }
    isLoading.value = false;
  }

  void showCarousel(int id) {
    noSearchresult.value = false;
    isLoading.value = true;
    switch (id) {
      case 0:
        carouselMoviesList.value = theaterMoviesList;
        break;
      case 1:
        carouselMoviesList.value = upcomingmoviesList;
        break;
      case 2:
        carouselMoviesList.value = popularmoviesList;
        break;
      case 3:
        carouselMoviesList.value = topMoviesList;
        break;
      default:
        carouselMoviesList.value = theaterMoviesList;
        break;
    }
    isLoading.value = false;
  }

  void searchMovies({required String query}) async {
    isLoading.value = true;
    noSearchresult.value = false;
    if (query == "") {
      isSearch.value = false;
      mainMovieList.value = topMoviesList;
    } else {
      isSearch.value = true;

      var searchmovies =
          await MovieDetailRepository().searchMovie(search: query);
      log(searchmovies.toString());
      if (searchmovies != []) {
        mainMovieList.value = searchmovies;
        isLoading.value = false;
        isSearch.value = false;
      }
    }
  }

  void retryMovie() async {
    isLoading.value = true;
    if (topMoviesList.isEmpty) {
      topMoviesList.value = await movieRepo.getTopRatesMovie();
      log("topMoviesList");
    }
    if (popularmoviesList.isEmpty) {
      popularmoviesList.value = await movieRepo.getPopularMovie();

      log("popularmoviesList");
    }
    if (theaterMoviesList.isEmpty) {
      theaterMoviesList.value = await movieRepo.getNowplayingMovie();

      log("theaterMoviesList");
    }
    if (upcomingmoviesList.isEmpty) {
      upcomingmoviesList.value = await movieRepo.getUpcomingMovie();
      log("upcomingmoviesList");
    }

    isLoading.value = false;
  }

  void getSimilar(String id) async {
    hasSimilarMovie = false.obs;
    similarMovies.value = await movieRepo.getSimilarMovie(movie_id: id);
    // while(similarMovies.isEmpty) {
    //   similarMovies.value = await movieRepo.getUpcomingMovie();
    // }
    log(similarMovies.toString());
    if (similarMovies.isNotEmpty) {
      hasSimilarMovie = true.obs;
    }
  }
}
