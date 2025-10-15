import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';
import 'package:mymovies/content/view/movie/main.dart';

Widget recommendItem(MovieModel item, BuildContext context) {
  final bytes = base64Decode(item.base64Image!);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MyMovieDetail(movie: item),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 400),
          ),
        );
      },
      child: Image.memory(
        bytes,
        scale: 1,
      ),
    ),
  );
}
