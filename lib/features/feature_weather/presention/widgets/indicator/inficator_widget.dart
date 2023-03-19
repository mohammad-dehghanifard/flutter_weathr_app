import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppIndicatorWidget extends StatelessWidget {
  final PageController pageController;
  final int count;
  final IndicatorEffect effect;

  const AppIndicatorWidget({Key? key, required this.pageController, required this.count, required this.effect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: effect,
    );
  }
}
