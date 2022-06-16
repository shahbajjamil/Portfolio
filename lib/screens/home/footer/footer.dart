import 'package:flutter/material.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/utils/screen_size.dart';
import 'package:portfolio/widget/circle.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: -screenSize(context).height * 0.1 / 2,
            left: screenSize(context).width * 0.2,
            child: BigCircle(radius: screenSize(context).height * 0.15)),
        Positioned(
            bottom: -screenSize(context).height * 0.1 / 2,
            right: screenSize(context).width * 0.2,
            child: BigCircle(radius: screenSize(context).height * 0.15)),
        Container(
          height: screenSize(context).height * 0.15,
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            "\u00a9 2022 I, Portfolio. All rights reserved | Design & developed by MD Shahbaj Jamil",
            style: n20_black(),
          ),
        ),
      ],
    );
  }
}
