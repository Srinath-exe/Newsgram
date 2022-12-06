import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/MovieDetailsModel.dart';
import 'package:news_app/Models/MoviesModel.dart';
import 'package:news_app/Repository/Repository..dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';

class MovieDetailRepository {
  final MovieController controller = Get.find();

  Future<MoviesDetailsModel?> getMovieDetails(
      {required String movie_id}) async {
    final response = await API.get(
      url:
          'https://api.themoviedb.org/3/movie/${movie_id}?api_key=${movieAPIKEY}',
      // onCatch: (e) {
      //   log("Movie Detail ERROR : $e");
      //   log("2nd req sent");
      //   // if (e.toString() == "Connection reset by peer") {
      //   controller.getMovieDetails(movie_id);
      //   // }
      // },
    );

    if (response != null) {
      var movieDetails = moviesDetailsModelFromJson(response.body);
      return movieDetails;
    } else {
      return null;
    }
  }

  Future<List<MoviesModel>> searchMovie({required String search}) async {
    controller.noSearchresult.value = false;
    search = search.replaceAll(" ", "%20");

    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/search/multi?api_key=${movieAPIKEY}&language=en-US&query=${search}&page=1&include_adult=false',
        onCatch: (e) {
          log("CATCH EXCETURDED $e");
          if (e.toString().contains("RangeError")) {
            controller.noSearchresult.value = true;
          }
          if (e.toString() == "Connection reset by peer") {
            controller.searchMovies(query: search);
          }
        });
    if (response != null) {
      var res = json.decode(response.body);
      if (res["results"] == null) {
        return [];
      }
      List<MoviesModel> lis = [];
      for (int i = 0; i < 20; i++) {
        if (res["results"][i]["media_type"] == "movie" &&
            res["results"][i]["poster_path"] != null) {
          lis.add(MoviesModel.fromJson(res["results"][i]));
        }
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return lis;
      }
      return lis;
    } else {
      return [];
    }
  }
}
