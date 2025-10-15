import 'package:mymovies/content/model/movies/movies_model.dart';

class MovieManager {
  static final MovieManager _instance = MovieManager._internal();
  factory MovieManager() {
    return _instance;
  }
  MovieManager._internal();

  List<Movie> newMovies = [];
  List<Movie> trendMovies = [];
}
