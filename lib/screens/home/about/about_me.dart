import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/widget/button.dart';
import 'package:portfolio/widget/circle.dart';
import 'package:portfolio/widget/helper.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColor.lightPink,
            AppColor.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -150,
            left: -150,
            child: BigCircle(radius: size.width * 0.4),
          ),
          Positioned(
            bottom: -300,
            right: -300,
            child: Transform.rotate(
              angle: 1,
              child: BigCircle(radius: size.width * 0.4),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset("assets/images/man-flag.png"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Me",
                    style: b45_black(),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    width: size.width * 0.4,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      style: n25_black(),
                      // softWrap: true,
                      // maxLines: 4,
                    ),
                  ),
                  LableName(
                    lable: "Name",
                    name: "MD Shahbaj Jamil",
                  ),
                  LableName(
                    lable: "Age",
                    name: "22 Years",
                  ),
                  LableName(
                    lable: "From",
                    name: "India",
                  ),
                  LableName(
                    lable: "Email",
                    name: "shahbajjamil2014@gmail.com",
                  ),
                  SizedBox(height: padding * 2),
                  Button(
                    textColor: true,
                    text: "Download CV",
                    onClicked: () {
                      print("Download CV");
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
