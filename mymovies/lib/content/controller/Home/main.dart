import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mymovies/content/controller/API/Movies/main.dart';
import 'package:mymovies/content/controller/services/movie_manager.dart';
import 'package:mymovies/content/model/filters/recommend_filter_model.dart';
import 'package:mymovies/content/model/movies/movie_detail_model.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

class HomeController {
  late BuildContext context;
  late StateSetter setState;
  bool isLoad = true;
  bool isLoadSecond = true;
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
      List<MovieModel> newMoviesResponse =
          await MovieEndpoints.getMoviesCommingSoon();
      if (newMoviesResponse.isNotEmpty) {
        MovieManager().newMovies = newMoviesResponse;
      }
      isLoad = false;
      setState(() {});
      List<MovieModel> trendMoviesResponse =
          await MovieEndpoints.getMoviesTrend();
      if (trendMoviesResponse.isNotEmpty) {
        MovieManager().trendMovies = trendMoviesResponse;
      }
      await getFilters();
    } catch (e) {
      print(e);
    }
    isLoad = false;
    isLoadSecond = false;
    setState(() {});
  }

  Future<bool> getFilters() async {
    Set<int> years = {};
    Set<String> languages = {};
    List<int> yearsList = [];
    List<String> languagesList = [];
    List<RecommendFilterModel> filterGenerated = [];
    try {
      for (MovieModel movie in MovieManager().trendMovies) {
        if (movie.movieDetail == null) {
          continue;
        }
        if (movie.movieDetail!.releaseDate != null) {
          years.add(movie.movieDetail!.releaseDate!.year);
        }
        if (movie.movieDetail!.spokenLanguages.isNotEmpty) {
          for (SpokenLanguage language in movie.movieDetail!.spokenLanguages) {
            languages.add(language.name);
          }
        }
      }
      yearsList = years.toList()..sort();
      languagesList = languages.toList()..sort();
    } catch (e) {
      print(e);
    }
    bool firstAdded = false;

    for (String language in languagesList) {
      if (language == "") {
        continue;
      }
      if (!firstAdded) {
        filterGenerated.add(RecommendFilterModel(
            text: language,
            textScreen: "En ${language}",
            typeFilter: 1,
            isSelected: true));
        MovieManager().filterSelected = filterGenerated.first;
        firstAdded = true;
        continue;
      }
      filterGenerated.add(RecommendFilterModel(
          text: language, textScreen: "En ${language}", typeFilter: 1));
    }
    for (int year in yearsList) {
      filterGenerated.add(RecommendFilterModel(
          text: year.toString(),
          textScreen: "Lanzados en ${year}",
          typeFilter: 2));
    }
    MovieManager().filters = filterGenerated;
    return true;
  }

  void selectFilter(RecommendFilterModel filterSelected) {
    for (RecommendFilterModel filter in MovieManager().filters) {
      if (filter.textScreen == filterSelected.textScreen) {
        filter.isSelected = true;
        MovieManager().filterSelected = filter;
        continue;
      }
      filter.isSelected = false;
    }
    setState(() {});
  }
}
