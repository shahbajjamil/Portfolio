import 'package:flutter/material.dart';
import 'package:portfolio/values/values.dart';

class AnimatedHoverIndicator extends StatelessWidget {
  const AnimatedHoverIndicator({
    super.key,
    required this.width,
    this.indicatorColor = AppColors.yellow450,
    this.height = 6,
    this.curve = Curves.linearToEaseOut,
    this.isHover = false,
    this.duration = const Duration(milliseconds: 300),
  });

  final Color indicatorColor;
  final double width;
  final double height;
  final Curve curve;
  final Duration duration;
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isHover ? width : 0,
      height: height,
      color: indicatorColor,
      duration: duration,
      curve: curve,
    );
  }
}

class AnimatedHoverIndicator2 extends StatelessWidget {
  const AnimatedHoverIndicator2({
    super.key,
    // required this.width,
    required this.animation,
    this.indicatorColor = AppColors.white,
    this.height = 1,
    this.curve = Curves.linearToEaseOut,
    this.duration = const Duration(milliseconds: 800),
  });

  final Color indicatorColor;
  // final double width;
  final double height;
  final Curve curve;
  final Animation<double> animation;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: animation.value,
      height: height,
      color: indicatorColor,
      duration: duration,
      curve: curve,
    );
  }
}
