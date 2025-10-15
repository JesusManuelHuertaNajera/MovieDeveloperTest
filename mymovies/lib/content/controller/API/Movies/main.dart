import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mymovies/content/config/api/main.dart';
import 'package:mymovies/content/model/movies/movie_detail_model.dart';
import 'package:mymovies/content/model/movies/movie_video_model.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

class MovieEndpoints {
  static Future<List<MovieModel>> getMoviesCommingSoon() async {
    List<MovieModel> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();
      final now = DateTime.now();
      final lastMonth = now.subtract(const Duration(days: 60));
      Map<String, dynamic> body = {};
      http.Response response =
          await api.apiGet(request: "movie/upcoming", queryParams: {
        "language": "es-ES",
        'sort_by': 'primary_release_date.desc',
        'with_release_type': '2|3',
        'release_date.gte': lastMonth.toIso8601String().split('T').first,
        'release_date.lte': now.toIso8601String().split('T').first,
      });
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData['results'] ?? []) {
        MovieModel toSave = MovieModel.fromJson(movies);
        if (toSave.posterPath == null) {
          continue;
        }
        bool isSaved = await toSave.saveImage();
        if (isSaved == false) {
          continue;
        }
        await toSave.getDetail();
        await toSave.getVideos();
        movieList.add(toSave);
      }

      return movieList.reversed.toList();
    } catch (error) {
      return movieList;
    }
  }

  static Future<List<MovieModel>> getMoviesTrend() async {
    List<MovieModel> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();
      http.Response response = await api
          .apiGet(request: "movie/popular", queryParams: {"language": "es-ES"});
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData['results'] ?? []) {
        MovieModel toSave = MovieModel.fromJson(movies);
        if (toSave.posterPath == null) {
          continue;
        }
        bool isSaved = await toSave.saveImage();
        if (isSaved == false) {
          continue;
        }
        await toSave.getDetail();
        await toSave.getVideos();
        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }

  static Future<MovieDetailModel?> getMovieDetail(int idMovie) async {
    MovieDetailModel? movieList;
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();

      Map<String, dynamic> body = {};
      http.Response response = await api.apiGet(
          request: "movie/${idMovie}", queryParams: {'language': 'es-ES'});
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      MovieDetailModel toSave = MovieDetailModel.fromJson(responseData);
      if (toSave.posterPath == null) {
        return null;
      }
      bool isSaved = await toSave.saveImage();
      if (isSaved == false) {
        return null;
      }

      return toSave;
    } catch (error) {
      return movieList;
    }
  }

  static Future<MovieVideosModel?> getMovieVideo(int idMovie) async {
    MovieVideosModel? movieList;
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();

      Map<String, dynamic> body = {};
      http.Response response = await api.apiGet(
          request: "movie/${idMovie}/videos",
          queryParams: {'language': 'es-ES'});
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      MovieVideosModel toSave = MovieVideosModel.fromJson(responseData);

      return toSave;
    } catch (error) {
      return movieList;
    }
  }
}
