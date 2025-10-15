import 'package:mymovies/content/config/api/config.dart';
import 'package:mymovies/content/config/methods/dowload_image.dart';
import 'package:mymovies/content/controller/API/Movies/main.dart';
import 'package:mymovies/content/model/movies/movie_detail_model.dart';
import 'package:mymovies/content/model/movies/movie_video_model.dart';

class MovieModel {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  MovieDetailModel? movieDetail;
  MovieVideosModel? videos;
  String? base64Image;
  MovieModel({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  Future<bool> saveImage() async {
    try {
      if (posterPath == null) {
        return false;
      }
      base64Image = await getBase64ImageFromUrl(
          "${ApiValues.baseUrlImage}/t/p/w200${posterPath}");
      if (base64Image == null) {
        return false;
      }
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> getDetail() async {
    try {
      movieDetail = await MovieEndpoints.getMovieDetail(id);
    } catch (e) {
      return false;
    }
    return movieDetail != null;
  }

  Future<bool> getVideos() async {
    try {
      videos = await MovieEndpoints.getMovieVideo(id);
    } catch (e) {
      return false;
    }
    return videos != null;
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'],
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
