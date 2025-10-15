import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mymovies/content/controller/API/Movies/main.dart';
import 'package:mymovies/content/controller/services/movie_manager.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

class HomeController {
  late BuildContext context;
  late StateSetter setState;
  bool isLoad = true;

  ScrollController scrollControllerHome = ScrollController();
  ScrollController scrollControllerCommingSoon = ScrollController();
  ScrollController scrollControllerTrend = ScrollController();
  ScrollController scrollControllerRecommend = ScrollController();
  ScrollController scrollControllerRecommendFilters = ScrollController();
  Future<void> start() async {
    Timer(const Duration(seconds: 1), initializeData);
  }

  Future<void> initializeData() async {
    try {
      List<Movie> newMoviesResponse =
          await MovieEndpoints.getMoviesCommingSoon();
      List<Movie> trendMoviesResponse = await MovieEndpoints.getMoviesTrend();
      if (newMoviesResponse.isNotEmpty) {
        MovieManager().newMovies = newMoviesResponse;
      }
      if (trendMoviesResponse.isNotEmpty) {
        MovieManager().trendMovies = trendMoviesResponse;
      }
    } catch (e) {
      print(e);
    }
    isLoad = false;
    setState(() {});
  }
}
