import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/styles/main.dart';

Widget loaderScreen({bool showText = true}){
  return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(showText)
                    Text(
                      "Cargando...",
                      style: TextStylesCustom.titleMain(
                          color: AppColors.textColorWhite),
                    )
                  ],
                );
}