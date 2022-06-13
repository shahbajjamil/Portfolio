import 'package:flutter/material.dart';
import 'package:portfolio/utils/colorMaker.dart';

import '../../../../utils/color.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  final String title;
  final double value;
  final Color color;

  List convertValue(val) {
    if (val >= 1) return ["10", "0"];

    double first = val * 10;
    String format = first.toStringAsFixed(2);
    first.toString().split(".");
    return format.toString().split(".");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List valueList = convertValue(value);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  value: value,
                  strokeWidth: 8,
                  backgroundColor: lighten(color, 0.3),
                  color: color,
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: valueList[0],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: AppColor.black,
                        ),
                        children: [
                          TextSpan(
                            text: ".${valueList[1]}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: AppColor.black,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: color,
          ),
        )
      ],
    );
  }
}
