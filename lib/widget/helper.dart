import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';

class LabelName extends StatelessWidget {
  const LabelName({
    Key? key,
    required this.label,
    required this.name,
  }) : super(key: key);

  final String label;
  final String name;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label + " ",
        style: b20_black(),
        children: [
          TextSpan(text: ": " + name, style: n20_black()),
        ],
      ),
    );
  }
}
