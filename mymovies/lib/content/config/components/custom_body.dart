import 'package:flutter/material.dart';
import 'package:mymovies/content/config/colors/main.dart';
import 'package:mymovies/content/config/components/loader_screen.dart';
import 'package:mymovies/content/config/styles/main.dart';

Widget customBody(
    {bool showLoader = false,
    bool showTitleApp = false,
    AppBar? appBar,
    ScrollController? controllerScroll,
    Widget? body,
    List<Widget> content = const []}) {
  AppBar? useAppBar;
  if (showTitleApp) {
    useAppBar = AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        "My Movies",
        style: TextStylesCustom.titleSecondary(color: AppColors.textColorWhite),
      ),
    );
  }
  if (appBar != null) {
    useAppBar = appBar;
  }
  return SafeArea(
    child: Scaffold(
      appBar: useAppBar,
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.secondaryColor,
                AppColors.primaryColor,
              ],
            ),
          ),
          child: showLoader
              ? loaderScreen()
              : body ??
                  ListView(
                    controller: controllerScroll,
                    children: content,
                  )),
    ),
  );
}
