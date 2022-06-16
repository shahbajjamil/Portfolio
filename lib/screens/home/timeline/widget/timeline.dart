import 'package:flutter/material.dart';

import '../../../../utils/color.dart';
import '../../../../utils/screen_size.dart';

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.barColor,
    required this.logoColor,
    required this.index,
    required this.totalLength,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color barColor;
  final Color logoColor;
  final IconData icon;
  final int index;
  final int totalLength;

  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: size.width * 0.26,
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.white,
        gradient: totalLength - 1 == index
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff4576FC),
                  Color(0xffDB8DFB),
                ],
              )
            : null,
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
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            // margin: const EdgeInsets.fromLTRB(0, 10, 15, 10),
            decoration: BoxDecoration(color: logoColor, shape: BoxShape.circle),
            child: FittedBox(child: Icon(icon)),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
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
  const DateView({Key? key, required this.index, required this.date})
      : super(key: key);

  final int index;
  final String date;

  @override
  Widget build(BuildContext context) {
    Size size = screenSize(context);

    return Container(
      width: size.width * 0.26,
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
  const CenterLine({Key? key, required this.index, required this.totalLength})
      : super(key: key);
  final int index;
  final int totalLength;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 8,
          decoration: BoxDecoration(
              color: AppColor.darkRed,
              borderRadius: BorderRadius.vertical(
                  top: index == 0 ? const Radius.circular(10) : Radius.zero,
                  bottom: index == totalLength - 1
                      ? const Radius.circular(10)
                      : Radius.zero)),
        ),
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
