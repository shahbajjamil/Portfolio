import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/screen_size.dart';

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
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return TimeLineTile(
                        date: "2014 - 2016",
                        index: index,
                        title: "Secondary School Education",
                        subtitle: "Ranchi, Jharkhand",
                        barColor: Colors.red,
                        logoColor: Colors.green,
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
  }) : super(key: key);
  final int index;

  final String date;
  final String title;
  final String subtitle;
  final Color barColor;
  final Color logoColor;

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
                ),
          const CenterLine(),
          index % 2 == 0
              ? TimeLineCard(
                  title: title,
                  subtitle: subtitle,
                  barColor: barColor,
                  logoColor: logoColor,
                )
              : DateView(date: date, index: index),
        ],
      ),
    );
  }
}

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.barColor,
    required this.logoColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color barColor;
  final Color logoColor;

  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: size.width * 0.25,
      // height: 80,
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            color: AppColor.black.withOpacity(0.3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 10,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
            decoration: BoxDecoration(color: logoColor, shape: BoxShape.circle),
            child: const FittedBox(child: Icon(Icons.mark_email_read_sharp)),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateView extends StatelessWidget {
  const DateView({
    Key? key,
    required this.index,
    required this.date,
  }) : super(key: key);

  final int index;
  final String date;

  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: size.width * 0.25,
      // height: 80,
      child: Row(
        mainAxisAlignment:
            index % 2 == 0 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          const Icon(Icons.calendar_today_outlined),
          const SizedBox(width: 10),
          Text(
            date,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CenterLine extends StatelessWidget {
  const CenterLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: 8, color: AppColor.darkRed),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(color: AppColor.red, spreadRadius: 24),
              // BoxShadow(color: AppColor.blue, spreadRadius: 16),s
              BoxShadow(color: AppColor.red, spreadRadius: 8),
            ],
            border: Border.all(color: AppColor.white, width: 8),
            color: AppColor.red,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
