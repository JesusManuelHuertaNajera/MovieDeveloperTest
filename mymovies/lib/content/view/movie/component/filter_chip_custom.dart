import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';

Widget filterChipCustom(String text, [bool showStar = false]) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: FilterChip(
        backgroundColor: Colors.white,
        label: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showStar)
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15,
                ),
              ),
            Text(
              text,
              style: TextStyle(color: AppColors.secondaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onSelected: (v) {}),
  );
}
