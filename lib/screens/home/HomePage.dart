import 'package:flutter/material.dart';
import 'package:portfolio/screens/home/about/about_me.dart';
import 'package:portfolio/screens/home/appbar.dart';
import 'package:portfolio/screens/home/info/info.dart';
import 'package:portfolio/screens/home/project/project.dart';
import 'package:portfolio/screens/home/timeline/timeline.dart';

import 'experience/experience.dart';
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
    return Scaffold(
      // backgroundColor: AppColor().secondaryColor,
      // appBar: AppBar(
      //   title: Text("MD Shahbaj Jamil"),
      // ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: [
            // Column(
            //   children: [
            //     Appbar(),
            //     InfoPage(),
            //   ],
            // ),
            // AboutMe(),
            // Project(),
            // Experience(),
            // SkillHobbies(),
            TimeLine(),
          ],
          // itemBuilder: (context, index) {

          // switch (index) {
          //   case 0:
          //     return AboutMe();
          //   case 1:
          //     return Experience();
          //   case 2:
          //     return Project();
          //   case 3:
          //     return SkillHobbies();
          //   case 4:
          //   // return Info();
          //   default:
          //     return AboutMe();
          // }
          // },
        ),
        // child: SingleChildScrollView(
        //     child: Column(
        //   children: const [
        //     Appbar(),
        //     InfoPage(),
        //     AboutMe(),
        //     Project(),
        //     Experience(),
        //     SkillHobbies(),
        //   ],
        // )),
      ),
    );
  }
}
