import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/components/loader_screen.dart';
import 'package:mymovies/content/config/styles/main.dart';
import 'package:mymovies/content/controller/Home/main.dart';
import 'package:mymovies/content/controller/services/movie_manager.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';
import 'package:mymovies/content/view/home/component/recommend_filter.dart';
import 'package:mymovies/content/view/home/component/recommend_item.dart';

Widget RecommendSection(HomeController controller) {
  final movieManager = MovieManager();
  final filter = movieManager.filterSelected;

  List<MovieModel> filterListMovies = [];

  if (filter == null) {
    filterListMovies = movieManager.trendMovies.take(6).toList();
  }
  if (filter != null) {
    filterListMovies = movieManager.trendMovies
        .where((movie) {
          final detail = movie.movieDetail;
          if (detail == null) return false;

          if (filter.typeFilter == 1) {
            return detail.spokenLanguages
                .any((lang) => lang.name == filter.text);
          }
          if (filter.typeFilter == 2) {
            return detail.releaseDate?.year.toString() == filter.text;
          }
          return false;
        })
        .take(6)
        .toList();
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recomendados para ti",
          style:
              TextStylesCustom.titleSecondary(color: AppColors.textColorWhite),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller.scrollControllerRecommendFilters,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              ...MovieManager().filters.map((f) => filterRecommendItem(f, (v) {
                    controller.selectFilter(f);
                  }))
            ],
          ),
        ),
        controller.isLoadSecond
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [loaderScreen(showText: false)])
            : GridView.builder(
                controller: controller.scrollControllerRecommend,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.65,
                ),
                itemCount: filterListMovies.length,
                itemBuilder: (context, index) {
                  final movie = filterListMovies[index];
                  return recommendItem(movie, controller.context);
                },
              )
      ],
    ),
  );
}
