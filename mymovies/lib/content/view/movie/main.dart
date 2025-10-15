import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/components/custom_body.dart';
import 'package:mymovies/content/config/methods/open_youtube_video.dart';
import 'package:mymovies/content/config/styles/main.dart';
import 'package:mymovies/content/model/movies/movies_model.dart';
import 'package:mymovies/content/view/movie/component/filter_chip_custom.dart';

class MyMovieDetail extends StatefulWidget {
  final MovieModel movie;
  const MyMovieDetail({super.key, required this.movie});

  @override
  State<MyMovieDetail> createState() => _MyMovieDetailState();
}

class _MyMovieDetailState extends State<MyMovieDetail> {
  @override
  Widget build(BuildContext context) {
    final bytes = base64Decode(widget.movie.base64Image!);
    String? trailer = widget.movie.videos?.results
        .where((v) => v.site == "YouTube")
        .firstOrNull
        ?.key;
    return customBody(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        content: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Image.memory(
                  bytes,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    color: Colors.black.withOpacity(0.6),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            filterChipCustom(
                              "${widget.movie.movieDetail!.releaseDate!.year}",
                            ),
                            filterChipCustom(
                                "${widget.movie.movieDetail!.voteAverage.toStringAsFixed(2)}",
                                true)
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          if (trailer != null)
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor),
                onPressed: () {
                  openYoutubeVideo(trailer!);
                },
                child: Text(
                  "Ver Tráiler",
                  style: TextStylesCustom.titleMain(color: Colors.white),
                )),
          if (trailer == null)
            Center(
              child: Text(
                "Sin Tráiler",
                style: TextStylesCustom.titleMain(color: Colors.white),
              ),
            ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            children: [
              ...widget.movie.movieDetail!.genres
                  .map((g) => filterChipCustom(g.name))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: Colors.black.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${widget.movie.title}",
                      style: TextStylesCustom.titleSecondary(
                          color: AppColors.textColorWhite),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.movie.movieDetail?.overview ?? ""}",
                    style: TextStylesCustom.normalText(
                        color: AppColors.textColorWhite),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}
