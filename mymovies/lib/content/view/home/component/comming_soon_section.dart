import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/styles/main.dart';
import 'package:mymovies/content/controller/Home/main.dart';
import 'package:mymovies/content/controller/services/movie_manager.dart';
import 'package:mymovies/content/view/home/component/comming_soon_trend_item.dart';

Widget CommingSoonSection(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Proxímos estrenos",
          style:
              TextStylesCustom.titleSecondary(color: AppColors.textColorWhite),
        ),
        SingleChildScrollView(
          controller: controller.scrollControllerCommingSoon,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...MovieManager().newMovies.map(
                  (movie) => commingSoonTrendItem(movie, controller.context)),
            ],
          ),
        )
      ],
    ),
  );
}
