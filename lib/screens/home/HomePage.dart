import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/about/about_me.dart';
import 'package:portfolio/screens/home/appbar.dart';
import 'package:portfolio/screens/home/info/info.dart';
import 'package:portfolio/screens/home/project/project.dart';

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
      body: Container(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: const [
            Appbar(),
            InfoPage(),
            AboutMe(),
            Project(),
          ],
        )),
      ),
    );
  }
}
