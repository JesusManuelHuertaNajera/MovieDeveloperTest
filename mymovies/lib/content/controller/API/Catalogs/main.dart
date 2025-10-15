import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymovies/content/config/api/main.dart';
import 'package:mymovies/content/model/movies/movie_detail_model.dart';

class CatalogsEndpoints {
  static Future<List<Genre>> getGenres() async {
    List<Genre> movieList = [];
    try {
      ApiMethod api = ApiMethod();
      await api.addHeaderToken();

      Map<String, dynamic> body = {};
      http.Response response = await api
          .apiGet(request: "genre/movie/list", queryParams: {"language": "es"});
      if (response.statusCode != 200) {
        return movieList;
      }

      final responseData = json.decode(response.body);
      for (var movies in responseData['genres'] ?? []) {
        Genre toSave = Genre.fromJson(movies);

        movieList.add(toSave);
      }

      return movieList;
    } catch (error) {
      return movieList;
    }
  }
}
