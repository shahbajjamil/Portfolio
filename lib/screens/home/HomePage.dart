import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/appbar.dart';
import 'package:portfolio/screens/home/info/info.dart';
import 'package:portfolio/utils/color.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/fonts.dart';
import 'package:portfolio/widget/circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: AppColor().secondaryColor,
      // appBar: AppBar(
      //   title: Text("MD Shahbaj Jamil"),
      // ),
      body: Column(
        children: [
          Appbar(),
          InfoPage(),
        ],
      ),
    );
  }
}

