import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/Models/MovieDetailsModel.dart';
import 'package:news_app/Repository/Repository..dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/controllers/MovieController.dart';

class MovieDetailRepository {
  final MovieController controller = Get.find();
  Future<MoviesDetailsModel?> getMovieDetails(
      {required String movie_id}) async {
    try {
      final response = await API.get(
          url:
              'https://api.themoviedb.org/3/movie/${movie_id}?api_key=${movieAPIKEY}');
      log("Movie Detail Status : ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var movieDetails = moviesDetailsModelFromJson(response.body);
        log(movieDetails.toString());
        return movieDetails;
      } else {
        return null;
      }
    } catch (e) {
      log("Movie Detail ERROR : $e");
      log("2nd req sent");
      controller.getMovieDetails(movie_id);
      return null;
    }
  }
}
