// import 'dart:developer';

// import 'package:flutter/cupertino.dart';

// import '../../repository/repository.dart';
// import '../models/blog_model.dart';

// class BlogRepository {
//   Future<List<BlogModel>> getMovies(
//       {required String tag, required BuildContext context}) async {
//     final response = await API.get(context: context, url: 'blog/tag/$tag');
//     log(response.body);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       final blogList = blogModelFromJson(response.body);
//       return blogList;
//     } else {
//       return [];
//     }
//   }
// }
