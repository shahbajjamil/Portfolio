import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';

class LableName extends StatelessWidget {
  const LableName({
    Key? key,
    required this.lable,
    required this.name,
  }) : super(key: key);

  final String lable;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: lable + " ",
        style: b20_black(),
        children: [
          TextSpan(text: ": " + name, style: n20_black()),
        ],
      ),
    );
  }
}
