import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';

class TextStylesCustom {
  static TextStyle? small({
    double fontSize = 13,
    Color? color,
    FontWeight fontWeightC = FontWeight.w400,
    TextDecoration deco = TextDecoration.none,
    Color? decoColor,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeightC,
        letterSpacing: 0.5,
        color: color ??  AppColors.primaryColor,
        decorationColor: decoColor,
        decoration: deco);
  }

  static TextStyle? normalText({
    Color? color,
    FontWeight fontWeightC = FontWeight.w400,
    TextDecoration deco = TextDecoration.none,
    Color? decoColor,
  }) {
    return TextStyle(
        fontSize: 15,
        fontWeight: fontWeightC,
        letterSpacing: 0.5,
        color: color ?? AppColors.primaryColor,
        decorationColor: decoColor,
        decoration: deco);
  }

  static TextStyle? buttons({
    Color? color,
    FontWeight fontWeightC = FontWeight.w700,
    TextDecoration deco = TextDecoration.none,
    Color? decoColor,
  }) {
    return TextStyle(
        fontSize: 15,
        fontWeight: fontWeightC,
        letterSpacing: 0.5,
        color: color ?? AppColors.primaryColor,
        decorationColor: decoColor,
        decoration: deco);
  }

  static TextStyle? titleSecondary({
    Color? color,
    FontWeight fontWeightC = FontWeight.w500,
    TextDecoration deco = TextDecoration.none,
    Color? decoColor,
  }) {
    return TextStyle(
        fontSize: 17,
        fontWeight: fontWeightC,
        letterSpacing: 0.5,
        color: color ?? AppColors.primaryColor,
        decorationColor: decoColor,
        decoration: deco);
  }

  static TextStyle? titleMain({
    Color? color,
    FontWeight fontWeightC = FontWeight.w700,
    TextDecoration deco = TextDecoration.none,
    Color? decoColor,
  }) {
    return TextStyle(
        fontSize: 23,
        fontWeight: fontWeightC,
        letterSpacing: 0.5,
        color: color ?? AppColors.primaryColor,
        decorationColor: decoColor,
        decoration: deco);
  }
}
