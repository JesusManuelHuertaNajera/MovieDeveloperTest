import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';

Widget commingSoonItem(Movie item) {
  final bytes = base64Decode(item.base64Image!);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      child: Image.memory(
        bytes,
        scale: 1.7,
      ),
    ),
  );
}
