import 'dart:convert';
import 'dart:developer';
import 'package:news_app/Models/MoviesModel.dart';
import 'package:news_app/Models/ReviewsModel.dart';
import 'package:news_app/Repository/Repository..dart';
import 'package:news_app/constants/constants.dart';

class MovieRepository {
  Future<List<MoviesModel>> getTopRatesMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/top_rated?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var movieList = moviesModelFromJson(res["results"]);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getNowplayingMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/now_playing?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var movieList = moviesModelFromJson(res["results"]);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getUpcomingMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/upcoming?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var movieList = moviesModelFromJson(res["results"]);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getPopularMovie() async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/popular?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var movieList = moviesModelFromJson(res["results"]);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> getSimilarMovie({required String movie_id}) async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/movie/${movie_id}/similar?api_key=${movieAPIKEY}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      // log(res["results"].toString());
      var movieList = moviesModelFromJson(res["results"]);
      log(movieList.toString());
      return movieList;
    } else {
      return [];
    }
  }

  Future<List<MoviesModel>> searchMovie({required String search}) async {
    final response = await API.get(
        url:
            'https://api.themoviedb.org/3/search/multi?api_key=${APIKEY}&language=en-US&query=${search}&page=1&include_adult=false');
    var res = json.decode(response.body);
    if (res["results"] == null) {
      return [];
    }
    List<MoviesModel> lis = [];
    for (int i = 0; i < 20; i++) {
      if (res["results"][i]["media_type"] != "person") {
        lis.add(MoviesModel.fromJson(res["results"][i]));
      }
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return lis;
    } else {
      return [];
    }
  }

// sfadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

  // Future<List<MovieModel>> searchMovie({required String search}) async {
  //   final response = await API.get(
  //       url:
  //           'https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=${search}&api-key=${APIKEY}');
  //   var res = json.decode(response.body);
  //   if (res["results"] == null) {
  //     return [];
  //   }
  //   List<MovieModel> lis = [];
  //   List.generate(
  //       res["num_results"],
  //       (index) => {
  //             if (res["results"][index]["multimedia"] != null)
  //               {lis.add(MovieModel.fromJson(res["results"][index]))}
  //           });

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return lis;
  //   } else {
  //     return [];
  //   }
  // }
}
