import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';

class SmallCircle extends StatelessWidget {
  const SmallCircle({
    Key? key,
    required this.radius,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor().red.withOpacity(0.5),
            AppColor().secondaryColor,
          ],
        ),
      ),
    );
  }
}
