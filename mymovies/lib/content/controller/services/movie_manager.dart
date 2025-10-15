import 'package:mymovies/content/model/filters/recommend_filter_model.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

class MovieManager {
  static final MovieManager _instance = MovieManager._internal();
  factory MovieManager() {
    return _instance;
  }
  MovieManager._internal();

  List<MovieModel> newMovies = [];
  List<MovieModel> trendMovies = [];
  List<RecommendFilterModel> filters = [];
  RecommendFilterModel? filterSelected;
}
