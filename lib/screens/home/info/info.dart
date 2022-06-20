import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/utils/responsive_layout.dart';
import 'package:portfolio/widget/circle.dart';
import 'dart:ui' as ui;

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height - 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.secondaryColor,
            AppColor.lightPink,
            AppColor.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.22,
            child: SmallCircle(
                radius: ResponsiveLayout.isTablet(context)
                    ? size.width * 0.2
                    : ResponsiveLayout.isPhone(context)
                        ? size.width * 0.4
                        : size.width * 0.1),
          ),
          Positioned(
            right: 0,
            bottom: size.width / 4,
            child: Container(
              width: ResponsiveLayout.isComputer(context)
                  ? size.width * 0.5
                  : ResponsiveLayout.isTablet(context) ||
                          ResponsiveLayout.isPhone(context)
                      ? size.width * 0.8
                      : size.width * 0.6,
              child: CustomPaint(painter: MyPainter()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: ResponsiveLayout.isComputer(context)
                    ? size.width * 0.5
                    : ResponsiveLayout.isTablet(context)
                        ? size.width * 0.8
                        : size.width * 0.9,
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/man-BG.png"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: ResponsiveLayout.isPhone(context)
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            crossAxisAlignment: ResponsiveLayout.isPhone(context) ||
                    ResponsiveLayout.isTablet(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(
                    ResponsiveLayout.isPhone(context) ? 0 : padding),
                child: Column(
                  mainAxisAlignment: ResponsiveLayout.isPhone(context) ||
                          ResponsiveLayout.isTablet(context)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(ResponsiveLayout.isPhone(context)
                          ? padding / 2
                          : padding),
                      margin: EdgeInsets.only(
                        top:
                            ResponsiveLayout.isPhone(context) ? padding * 5 : 0,
                      ),
                      decoration: BoxDecoration(
                          color: const Color(0x77FFFFFF),
                          borderRadius: BorderRadius.circular(padding),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Hello, I’m",
                              style: ResponsiveLayout.isTablet(context) ||
                                      ResponsiveLayout.isPhone(context)
                                  ? n25_black()
                                  : n50_black(),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "MD Shahbaj Jamil",
                            style: ResponsiveLayout.isTablet(context) ||
                                    ResponsiveLayout.isPhone(context)
                                ? sb25_black()
                                : sb50_black(),
                          ),
                          Text(
                            "I'm Flutter and Web Developer.",
                            style: ResponsiveLayout.isTablet(context) ||
                                    ResponsiveLayout.isPhone(context)
                                ? n20_black()
                                : n30_black(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Transform.rotate(
                        angle: -0.2,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.red,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(padding / 2)),
                            padding: const EdgeInsets.symmetric(
                              vertical: padding,
                              horizontal: padding * 2,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Hire me",
                            style: n20_white(),
                          ),
                        ),
                      ),
                    ),
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

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.9, 0),
        Offset(-size.width * 0.01, 0),
        [
          AppColor.primaryColor.withOpacity(0.6),
          AppColor.lightBlue,
        ],
      );
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    canvas.drawArc(rect, -0.5, 3.15, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
