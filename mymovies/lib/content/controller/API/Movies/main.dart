import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mymovies/content/config/api/main.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

class MovieEndpoints {
  static Future<List<Movie>> getMoviesCommingSoon() async {
    List<Movie> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();

      Map<String, dynamic> body = {};
      http.Response response = await api.apiGet(
        request: "movie/upcoming",
      );
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData['results'] ?? []) {
        Movie toSave = Movie.fromJson(movies);
        if (toSave.posterPath == null) {
          continue;
        }
        bool isSaved = await toSave.saveImage();
        if (isSaved == false) {
          continue;
        }
        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }
   static Future<List<Movie>> getMoviesTrend() async {
    List<Movie> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();

      Map<String, dynamic> body = {};
      http.Response response = await api.apiGet(
        request: "movie/popular",
      );
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData['results'] ?? []) {
        Movie toSave = Movie.fromJson(movies);
        if (toSave.posterPath == null) {
          continue;
        }
        bool isSaved = await toSave.saveImage();
        if (isSaved == false) {
          continue;
        }
        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }
}
