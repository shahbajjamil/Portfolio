import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/utils/functions.dart';
import 'package:portfolio/values/app_images.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../widgets/app_drawer.dart';
import '../../widgets/nav_item.dart';
import 'sections/header_section/header_section.dart';
import 'sections/nav_section/nav_bar_mobile.dart';
import 'sections/nav_section/nav_bar_web.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  List<NavItemData> navItems = [
    NavItemData(name: AppConst.home, key: GlobalKey(), isSelected: true),
    NavItemData(name: AppConst.about, key: GlobalKey()),
    NavItemData(name: AppConst.services, key: GlobalKey()),
    NavItemData(name: AppConst.projects, key: GlobalKey()),
    NavItemData(name: AppConst.awards, key: GlobalKey()),
    NavItemData(name: AppConst.blog, key: GlobalKey()),
  ];

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );
  // bool isFabVisible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 100) {
        _controller.reverse();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;
    return Scaffold(
        key: _scaffoldKey,
        drawer: ResponsiveBuilder(
          refinedBreakpoints: const RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < const RefinedBreakpoints().desktopSmall) {
              return AppDrawer(menuList: navItems);
            } else {
              return Container();
            }
          },
        ),
        floatingActionButton: ScaleTransition(
          scale: _animation,
          child: FloatingActionButton(
            onPressed: () {
              // Scroll to header section
              scrollToSection(navItems[0].key.currentContext!);
            },
            child: const Icon(
              FontAwesomeIcons.arrowUp,
              size: Sizes.ICON_SIZE_18,
              color: AppColors.white,
            ),
          ),
        ),
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
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(AppImage.BLOB_BEAN_ASH),
                          ),
                        ),
                        Column(
                          children: [
                            HeaderSection(key: navItems[0].key),
                            SizedBox(height: spacerHeight),
                            // VisibilityDetector(
                            //   key: Key("about"),
                            //   onVisibilityChanged: (visibilityInfo) {
                            //     double visiblePercentage =
                            //         visibilityInfo.visibleFraction * 100;
                            //     if (visiblePercentage > 10) {
                            //       _controller.forward();
                            //     }
                            //   },
                            //   child: Container(
                            //     key: navItems[1].key,
                            //     child: AboutMeSection(),
                            //   ),
                            // ),
                          ],
                        )
                      ],
                    ),
                    // AboutSection(),
                    // ServicesSection(),
                    // ProjectsSection(),
                    // AwardsSection(),
                    // BlogSection(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
