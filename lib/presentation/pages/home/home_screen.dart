import 'package:flutter/material.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/nav_item.dart';
import 'sections/nav_section/nav_bar_mobile.dart';
import 'sections/nav_section/nav_bar_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<NavItemData> navItems = [
    NavItemData(name: AppConst.home, key: GlobalKey(), isSelected: true),
    NavItemData(name: AppConst.about, key: GlobalKey()),
    NavItemData(name: AppConst.services, key: GlobalKey()),
    NavItemData(name: AppConst.projects, key: GlobalKey()),
    NavItemData(name: AppConst.awards, key: GlobalKey()),
    NavItemData(name: AppConst.blog, key: GlobalKey()),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < const RefinedBreakpoints().desktopSmall) {
              return NavBarMobile(scaffoldKey: _scaffoldKey);
            } else {
              return NavBarWeb(navItems: navItems);
            }
          },
        ),
        // NavBarWeb(
        //   navItems: navItems,
        // ),
      ],
    ));
  }
}

// class NavItemData {
//   final String name;
//   final GlobalKey key;
//   bool isSelected;

//   NavItemData({
//     required this.name,
//     required this.key,
//     this.isSelected = false,
//   });
// }
