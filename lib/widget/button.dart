import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
    this.color,
    this.shadowColor,
   required this.textColor,
  }) : super(key: key);
  final String text;
  final VoidCallback onClicked;
  final Color? color;
  final Color? shadowColor;
  final bool textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color ?? AppColor().red,
        elevation: 10,
        shadowColor: shadowColor ?? AppColor().black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(padding / 3)),
        padding: EdgeInsets.symmetric(
          vertical: padding,
          horizontal: padding * 2,
        ),
      ),
      onPressed: onClicked,
      child: Text(
        text,
        style: textColor ? n20_white() : n20_black(),
      ),
    );
  }
}
