import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/styles/main.dart';
import 'package:mymovies/content/model/filters/recommend_filter_model.dart';

Widget filterRecommendItem(
    RecommendFilterModel content, void Function(bool)? onSelected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: FilterChip(
        backgroundColor:
            !content.isSelected ? Colors.white : AppColors.secondaryColor,
        label: Text(
          content.textScreen,
          style: TextStylesCustom.small(
              color:
                  content.isSelected ? Colors.white : AppColors.primaryColor),
        ),
        onSelected: onSelected),
  );
}
