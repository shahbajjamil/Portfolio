import 'package:flutter/material.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/presentation/widgets/content_area.dart';
import 'package:portfolio/presentation/widgets/custom_info_section.dart';
import 'package:portfolio/presentation/widgets/skill_card.dart';
import 'package:portfolio/presentation/widgets/skill_level.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';

import 'package:responsive_builder/responsive_builder.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kRunSpacing = 20.0;
const double kMainAxisSpacing = 16.0;
const double kCrossAxisSpacing = 16.0;

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthLg = screenWidth * 0.5;
    double contentAreaWidthSm = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight * 1.6,
      screenHeight * 0.8,
      md: screenHeight * 0.8,
      sm: screenHeight * 1.6, 
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= const RefinedBreakpoints().tabletSmall) {
            return VisibilityDetector(
              key: const Key('skills-section-sm'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 20) {
                  controller.forward();
                }
              },
              child: Container(
                child: Column(
                  children: [
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: buildCustomSm(width: contentAreaWidthSm),
                    ),
                    const SpaceH40(),
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: Center(
                        child: Column(
                          children: buildBoxesSm(Data.skillCardData),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (screenWidth > const RefinedBreakpoints().tabletSmall &&
              screenWidth <= 1024) {
            return VisibilityDetector(
              key: const Key('skills-section-md'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 25) {
                  controller.forward();
                }
              },
              child: Container(
                child: Column(
                  children: [
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: buildCustomSm(width: contentAreaWidthSm),
                    ),
                    const SpaceH40(),
                    ContentArea(
                      width: contentAreaWidthSm,
                      child: Center(
                        child: buildSkillBoxes(boxHeight: 250),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return VisibilityDetector(
              key: const Key('skills-section-lg'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 50) {
                  controller.forward();
                }
              },
              child: Container(
                child: Row(
                  children: [
                    ContentArea(
                      width: contentAreaWidthLg,
                      child: buildCustomLg(width: contentAreaWidthLg),
                    ),
                    ContentArea(
                      width: contentAreaWidthLg,
                      height: contentAreaHeight,
                      padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.HEIGHT_48),
                      child: Center(
                        child: buildSkillBoxes(
                          boxHeight: 250,
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  List<Widget> buildSkillSection(
    List<SkillLevelData> skillLevels,
    double width,
  ) {
    List<Widget> items = [];
    for (int index = 0; index < skillLevels.length; index++) {
      items.add(
        SkillLevel(
          skillLevelWidth: width,
          controller: controller,
          skill: skillLevels[index].skill,
          level: skillLevels[index].level,
        ),
      );
    }
    return items;
  }

  Widget buildSkillBoxes({
    required double boxHeight,
    int crossAxisCount = 2,
    double? boxWidth,
  }) {
    double invisibleBoxHeight = responsiveSize(context, 0, 10, md: 10, sm: 10);

    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: crossAxisCount,
        itemCount: Data.skillCardData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == 1 || index == 5) {
            return Container(color: Colors.transparent);
          } else {
            return SkillCard(
              width: boxWidth,
              title: Data.skillCardData[index].title,
              description: Data.skillCardData[index].description,
              iconData: Data.skillCardData[index].iconData,
            );
          }
        },
        staggeredTileBuilder: (int index) {
          if (index == 1 || index == 5) {
            return StaggeredTile.extent(1, invisibleBoxHeight);
          } else {
            return StaggeredTile.extent(1, boxHeight);
          }
        },
        mainAxisSpacing: kMainAxisSpacing,
        crossAxisSpacing: kCrossAxisSpacing,
      ),
    );
  }

  List<Widget> buildBoxesSm(List<SkillCardData> skill) {
    List<Widget> items = [];
    for (int index = 0; index < skill.length; index++) {
      if (index != 1 && index != 5) {
        items.add(
          SkillCard(
            width: widthOfScreen(context),
            height: 200,
            title: skill[index].title,
            description: skill[index].description,
            iconData: skill[index].iconData,
          ),
        );
        items.add(const SpaceH16());
      }
    }
    return items;
  }

  Widget buildCustomLg({required double width}) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInfoSection1(
                  sectionTitle: AppConst.MY_SKILLS,
                  title1: AppConst.SKILLS_TITLE_1,
                  title2: AppConst.SKILLS_TITLE_2,
                  body: AppConst.SKILLS_DESC,
                  child: Wrap(
                    runSpacing: kRunSpacing,
                    children: buildSkillSection(
                      Data.skillLevelData,
                      width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCustomSm({required double width}) {
    return CustomInfoSection2(
      sectionTitle: AppConst.MY_SKILLS,
      title1: AppConst.SKILLS_TITLE_1,
      title2: AppConst.SKILLS_TITLE_2,
      body: AppConst.SKILLS_DESC,
      child: Wrap(
        runSpacing: kRunSpacing,
        children: buildSkillSection(
          Data.skillLevelData,
          width,
        ),
      ),
    );
  }
}
