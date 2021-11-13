import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);
  final String text;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColor().red,
        elevation: 10,
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
        style: n20_white(),
      ),
    );
  }
}