import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/utils/fonts.dart';

import '../../../utils/color.dart';
import '../../../widget/button.dart';
import '../../../widget/circle.dart';

class Experience extends StatefulWidget {
  const Experience({Key? key}) : super(key: key);

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        color: AppColor.white,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -size.width * 0.1,
            right: -size.width * 0.1,
            child: Transform.rotate(
              angle: -0.5,
              child: BigCircle(radius: size.width * 0.4),
            ),
          ),
          Positioned(
            top: 30,
            left: size.width / 2 - 50,
            child: Transform.rotate(
                angle: -0.5, child: BigCircle(radius: size.width * 0.15)),
          ),
          Positioned(
              top: -5,
              left: -5,
              child: Image.asset(
                'assets/images/bgsplash.png',
                // width: size.width * 5 + 20,
                scale: 1.3,
              )),
          Row(
            children: [
              Expanded(
                child: Container(
                  // color: Colors.transparent,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/images/man-note.png"),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      right: 50.0, top: 50.0, bottom: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 550,
                        child: Text(
                          "Every Signle Project Based on User Experience",
                          style: b40_black(),
                        ),
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor",
                        style: n20_black(),
                      ),
                      SizedBox(height: 50),
                      Button(
                        text: "Explore More",
                        onClicked: () {
                          print("Explore More");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
