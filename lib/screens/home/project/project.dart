import 'dart:html';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/project_model.dart';
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
  final CarouselController _controller = CarouselController();
  int _current = projectList.isEmpty ? 0 : 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> projectSlider = projectList
        .map(
          (item) => Container(
            // color: AppColor.black,
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
                      color: AppColor.lightBlue,
                      borderRadius: BorderRadius.circular(padding),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.subTitle,
                          style: sb25_black(),
                        ),
                        SizedBox(width: 100),
                        Text('${_current}', style: sb25_black()),
                        Text(" / " + projectList.length.toString(),
                            style: sb25_grey()),
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
                    color: AppColor.lightPink,
                    borderRadius: BorderRadius.circular(padding),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // image container
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.lightBlue,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.black.withOpacity(0.3),
                                blurRadius: padding,
                              )
                            ],
                            borderRadius: BorderRadius.circular(padding),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item.imageUrl),
                            ),
                          ),
                          width: size.width * 0.37,
                          height: size.height * 0.5,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // width: size.width * 0.37,
                          // height: size.height * 0.5,
                          alignment: Alignment.center,
                          // color: AppColor.lightBlue,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: sb25_black(),
                              ),
                              SizedBox(height: padding),
                              Text(
                                item.discription,
                                style: n20_black(),
                              ),
                              SizedBox(height: padding),
                              // Spacer(),
                              Button(
                                text: "Full View",
                                onClicked: () {
                                  print("full view" + item.projectUrl);
                                },
                                textColor: true,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
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
                  color: AppColor.lightBlue,
                  shadowColor: AppColor.primaryColor,
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
              CarouselSlider(
                items: projectSlider,
                carouselController: _controller,
                options: CarouselOptions(
                    height: size.height - (size.height * 0.1 + padding * 6),
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    disableCenter: false,
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    autoPlayCurve: Curves.easeInOut,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index + 1;
                      });
                    }),
              ),
              // TODO: bring to the bottom < | >
              Container(
                // color: AppColor.lightBlue,
                padding: EdgeInsets.all(padding * 2),
                height: size.height - (size.height * 0.1 + padding * 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () => _controller.previousPage(),
                        child: Icon(Icons.chevron_left, size: 50)),
                    RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.horizontal_rule, size: 50)),
                    InkWell(
                        onTap: () => _controller.nextPage(),
                        child: Icon(Icons.chevron_right, size: 50)),
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
