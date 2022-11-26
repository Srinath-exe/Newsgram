// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:news_app/Models/ReviewsModel.dart';
// import 'package:news_app/Repository/Repository..dart';
// import 'package:news_app/constants/constants.dart';

// class OldMovieRepository {
//   Future<List<MovieModel>> getMovie({String type = "all", int page = 0}) async {
//     final response = await API.get(
//         url:
//             'https://api.nytimes.com/svc/movies/v2/reviews/${type}.json?offset=${page}&api-key=${APIKEY}');

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       var movieList = reviewsModelFromJson(response.body);

//       return movieList.results!;
//     } else {
//       return [];
//     }
//   }

//   Future<List<MovieModel>> searchMovie({required String search}) async {
//     final response = await API.get(
//         url:
//             'https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=${search}&api-key=${APIKEY}');
//     var res = json.decode(response.body);
//     if (res["results"] == null) {
//       return [];
//     }
//     List<MovieModel> lis = [];
//     List.generate(
//         res["num_results"],
//         (index) => {
//               if (res["results"][index]["multimedia"] != null)
//                 {lis.add(MovieModel.fromJson(res["results"][index]))}
//             });

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       return lis;
//     } else {
//       return [];
//     }
//   }
// }
