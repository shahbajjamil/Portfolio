import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/widget/button.dart';

class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      padding: EdgeInsets.all(padding * 2),
      child: Column(
        children: [
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project",
                  style: b45_black(),
                ),
                Button(
                  text: "Full Project",
                  textColor: false,
                  color: AppColor().lightBlue,
                  shadowColor: AppColor().primaryColor,
                  onClicked: () {
                    print("full project");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: padding * 2),
          Stack(
            children: [
              Container(
                // color: AppColor().black,
                height: size.height - (size.height * 0.1 + padding * 6),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: padding * 2,
                      right: 0,
                      child: Container(
                        // width: size.width - padding * 2,
                        padding: EdgeInsets.fromLTRB(
                            padding, padding * 2, padding, padding),
                        decoration: BoxDecoration(
                          color: AppColor().lightBlue,
                          borderRadius: BorderRadius.circular(padding),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor().black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "shfdfkgdfk fhsfksdf sdsfsd fsdfsdf",
                              style: sb25_black(),
                            ),
                            SizedBox(width: 100),
                            Text("01", style: sb25_black()),
                            Text(" / 04", style: sb25_grey()),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: doublePadding,
                        horizontal: doublePadding * 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor().lightPink,
                        borderRadius: BorderRadius.circular(padding),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor().black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // image container
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor().red,
                              borderRadius: BorderRadius.circular(padding),
                            ),
                            width: size.width * 0.37,
                            height: size.height * 0.5,
                          ),
                          Container(
                            width: size.width * 0.37,
                            height: size.height * 0.5,
                            // color: AppColor().lightBlue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Project Title Name",
                                  style: sb25_black(),
                                ),
                                SizedBox(height: padding),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea......",
                                  style: n20_black(),
                                ),
                                SizedBox(height: padding),
                                // Spacer(),
                                Button(
                                  text: "Full View",
                                  onClicked: () {
                                    print("full view");
                                  },
                                  textColor: true,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: AppColor().lightBlue,
                padding: EdgeInsets.all(padding * 2),
                height: size.height - (size.height * 0.1 + padding * 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.chevron_left, size: 50),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.horizontal_rule, size: 50)),
                    Icon(Icons.chevron_right, size: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
