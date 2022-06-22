import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/utils/responsive_layout.dart';
import 'package:portfolio/utils/screen_size.dart';
import 'package:portfolio/widget/button.dart';
import 'package:portfolio/widget/circle.dart';
import 'package:portfolio/widget/glass_morphism.dart';
import 'package:portfolio/widget/helper.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);
    var textContent = Padding(
        // width: double.infinity,
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "About Me",
              style:
                  ResponsiveLayout.isPhone(context) ? b35_black() : b45_black(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: padding),
              // width: size.width * 0.4,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: ResponsiveLayout.isPhone(context)
                    ? n20_black()
                    : n25_black(),
                // softWrap: true,
                // maxLines: 4,
              ),
            ),
            const LabelName(label: "Name", name: "MD Shahbaj Jamil"),
            const LabelName(label: "Age", name: "22 Years"),
            const LabelName(label: "From", name: "India"),
            const LabelName(label: "Email", name: "shahbajjamil2014@gmail.com"),
            const SizedBox(height: padding * 2),
            Button(
              textColor: true,
              text: "Download CV",
              onClicked: () {
                print("Download CV");
              },
            ),
          ],
        ));
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
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -150,
            left: -150,
            child: BigCircle(
                radius: ResponsiveLayout.isLargeTablet(context)
                    ? size.width * 0.5
                    : ResponsiveLayout.isTablet(context)
                        ? size.width * 0.6
                        : ResponsiveLayout.isPhone(context)
                            ? size.width * 0.7
                            : size.width * 0.4),
          ),
          Positioned(
            bottom: -300,
            right: -300,
            child: Transform.rotate(
              angle: 1,
              child: BigCircle(radius: size.width * 0.4),
            ),
          ),
          Positioned(
            left: ResponsiveLayout.isPhone(context) ? -150 : 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: Image.asset(
                "assets/images/man-flag.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              // alignment: Alignment.center,
              margin: EdgeInsets.only(
                  right: ResponsiveLayout.isPhone(context) ? 20 : 40.0,
                  left: ResponsiveLayout.isComputer(context)
                      ? size.width * 0.5
                      : ResponsiveLayout.isLargeTablet(context)
                          ? size.width * 0.4
                          : ResponsiveLayout.isPhone(context)
                              ? 20
                              : 40),
              decoration: ResponsiveLayout.isComputer(context)
                  ? null
                  : BoxDecoration(
                      color: const Color(0x77FFFFFF),
                      borderRadius: BorderRadius.circular(padding),
                      boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              blurRadius: 5),
                        ]),
              child: textContent
              // : textContent,
              // : GlassMorphism(child: textContent, start: 0.1, end: 0.5),
              ),
        ],
      ),
    );
  }
}
