import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/about/about_me.dart';
import 'package:portfolio/screens/home/appbar.dart';
import 'package:portfolio/screens/home/info/info.dart';
import 'package:portfolio/screens/home/project/project.dart';
import 'package:portfolio/screens/home/timeline/timeline.dart';
import 'package:portfolio/utils/responsive_layout.dart';

import '../../utils/screen_size.dart';
import 'contact/contact_me.dart';
import 'experience/experience.dart';
import 'footer/footer.dart';
import 'skill_hobbies/hobbies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    print("-------------------------");
    log('Size :$size');
    log('isTinyHeightLimit :${ResponsiveLayout.isTinyHeightLimit(context)}');
    log('isTinyLimit :${ResponsiveLayout.isTinyLimit(context)}');
    log('isPhone :${ResponsiveLayout.isPhone(context)}');
    log('isTablet :${ResponsiveLayout.isTablet(context)}');
    log('isLargeTablet :${ResponsiveLayout.isLargeTablet(context)}');
    log('isComputer :${ResponsiveLayout.isComputer(context)}');

    String screenCheckUp() {
      if (ResponsiveLayout.isTinyHeightLimit(context)) {
        return 'Tiny Height Limit';
      } else if (ResponsiveLayout.isTinyLimit(context)) {
        return 'Tiny Limit';
      } else if (ResponsiveLayout.isPhone(context)) {
        return 'Phone';
      } else if (ResponsiveLayout.isTablet(context)) {
        return 'Tablet';
      } else if (ResponsiveLayout.isLargeTablet(context)) {
        return 'Large Tablet';
      } else if (ResponsiveLayout.isComputer(context)) {
        return 'Computer';
      } else {
        return 'Unknown';
      }
    }

    return Scaffold(
      // backgroundColor: AppColor().secondaryColor,
      // appBar: AppBar(
      //   title: Text("MD Shahbaj Jamil"),
      // ),
      body: Container(
        height: size.height,
        width: double.infinity,
        // child: PageView(
        //   scrollDirection: Axis.vertical,
        //   controller: pageController,
        //   children: [
        //     Column(
        //       children: [
        //         Appbar(),
        //         InfoPage(),
        //       ],
        //     ),
        //     AboutMe(),
        //     Project(),
        //     Experience(),
        //     SkillHobbies(),
        //     TimeLine(),
        //     ContactMe(),
        //     Footer(),
        //   ],

        // ),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                ResponsiveLayout(
                  tiny: Container(),
                  tablet: AppBarTabMode(),
                  phone: AppBarTabMode(),
                  largetTablet: AppBarTabMode(),
                  computer: Appbar(),
                ),
                InfoPage(),
              ],
            ),
            Text("${screenWidth(context)} : ${screenCheckUp()}"),
            AboutMe(),
            Project(),
            Experience(),
            SkillHobbies(),
            TimeLine(),
            ContactMe(),
            Footer(),
          ],
        )),
      ),
    );
  }
}
