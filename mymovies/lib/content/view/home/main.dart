import 'package:flutter/material.dart';
import 'package:mymovies/content/config/components/custom_body.dart';
import 'package:mymovies/content/controller/Home/main.dart';
import 'package:mymovies/content/view/home/component/comming_soon_section.dart';
import 'package:mymovies/content/view/home/component/recommend_section.dart';
import 'package:mymovies/content/view/home/component/trend_section.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController controller = HomeController();
  @override
  void initState() {
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setState = setState;
    controller.context = context;
    return customBody(
        showLoader: controller.isLoad,
        showTitleApp: true,
        controllerScroll: controller.scrollControllerHome,
        content: [
          CommingSoonSection(controller),
          TrendSection(controller),
          RecommendSection(controller)
        ]);
  }
}
