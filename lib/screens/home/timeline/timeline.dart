import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/model/hobbies_skills.dart';
import 'package:portfolio/screens/home/timeline/widget/timeline.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/screen_size.dart';

import '../../../model/time_line_model.dart';
import '../../../widget/circle.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -size.width * 0.25 / 2,
            left: -size.width * 0.25 / 2,
            child: Opacity(
              opacity: 0.3,
              child: BlueCircle(radius: size.width * 0.3),
            ),
          ),
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            child: Image.asset("assets/images/man-book.png"),
          ),
          Container(
            width: double.infinity,
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Awesome Jouney",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    color: AppColor.black,
                    height: 2,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: timelineData.length,
                    itemBuilder: (context, index) {
                      return TimeLineTile(
                        index: index,
                        totalLength: timelineData.length,
                        date: timelineData[index].date,
                        title: timelineData[index].title,
                        subtitle: timelineData[index].subtitle,
                        icon: timelineData[index].icon,
                        barColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        logoColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TimeLineTile extends StatelessWidget {
  const TimeLineTile({
    Key? key,
    required this.index,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.barColor,
    required this.logoColor,
    // required this.gradient,
    required this.totalLength,
    required this.icon,
  }) : super(key: key);

  final String date;
  final String title;
  final String subtitle;
  final Color barColor;
  final Color logoColor;
  final IconData icon;
  // final Gradient gradient;
  final int index;
  final int totalLength;

  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: size.width,
      height: size.height * 0.15,
      // color: AppColor.lightPink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          index % 2 == 0
              ? DateView(date: date, index: index)
              : TimeLineCard(
                  title: title,
                  subtitle: subtitle,
                  barColor: barColor,
                  logoColor: logoColor,
                  // gradient: gradient,
                  icon: icon,
                  index: index,
                  totalLength: totalLength,
                ),
          CenterLine(index: index, totalLength: totalLength),
          index % 2 == 0
              ? TimeLineCard(
                  title: title,
                  subtitle: subtitle,
                  barColor: barColor,
                  logoColor: logoColor,
                  icon: icon,
                  // gradient: gradient,
                  index: index,
                  totalLength: totalLength,
                )
              : DateView(date: date, index: index),
        ],
      ),
    );
  }
}
