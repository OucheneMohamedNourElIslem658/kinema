// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kinema/features/auth/controllers/auth.dart';
import 'package:kinema/models/movie.dart';
import 'package:http/http.dart' as http;

class ProgramRepo {
  final _url = 'http://10.0.2.2:8000/movies/';
  final _authController = Get.find<AuthController>();
  Future<List<Movie>?> getMovies() async {
    try {
      final List<Movie> movies = [];
      var url = Uri.parse('${_url}list/');
      final storage = GetStorage();
      var jwt = storage.read('jwt') as String;
      var response = await http.get(url, headers: {
        'Authorization': 'Bearer $jwt',
      });

      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;
        final moviesMap = result["results"] as List<dynamic>;
        for (var i = 0; i < moviesMap.length; i++) {
          final movieMap = moviesMap[i] as Map<String,dynamic>;
          final movie = Movie.fromMap(movieMap);
          movies.add(movie);
        }
        return movies;
      } else {
        _authController.signOut();
      }
    } catch (e) {
      _authController.signOut();
    }
    return null;
  }


}