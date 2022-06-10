import 'package:flutter/material.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
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
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 10),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                  top: size.height * 0.22,
                  // left: size.width * 0.1,
                  child: SmallCircle(radius: size.width * 0.1)),
              Padding(
                padding: const EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello, I’m",
                        style: n50_black(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(
                      "MD Shahbaj Jamil",
                      style: sb50_black(),
                    ),
                    Text(
                      "I'm Flutter and Web Developer.",
                      style: n30_black(),
                    ),
                    SizedBox(height: 50),
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
                            padding: EdgeInsets.symmetric(
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
          Stack(
            // fit: StackFit.loose,
            alignment: Alignment.centerRight,
            children: [
              Container(
                // color: Colors.green,
                width: size.width * 0.5,
                height: size.width * 0.5,
                child: CustomPaint(
                  painter: MyPainter(),
                  // child: Text("text"),
                  // size: MediaQuery.of(context).size,
                  // size: ,
                ),
              ),
              Image.asset("assets/images/man-BG.png"),
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
          // AppColor.red.withOpacity(0.8),
          AppColor.lightBlue,
        ],
      );
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.width / 2), radius: size.width / 2);
    //   canvas.drawArc(rect, 20.0, 0.0, true, paint);
    // final rect = Rect.fromPoints(Offset(size.height / 4, size.width / 4),
    //     Offset(size.height / 1.5, size.width / 2));
    // final center = Offset(size.height / 2, size.width / 2);
    // canvas.drawCircle(center, 200, paint);
    // canvas.drawRect(rect, paint);
    canvas.drawArc(rect, -0.5, 3.15, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
