import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/presentation/widgets/animated_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../utils/functions.dart';
import '../../../../../values/values.dart';
import '../../../../widgets/buttons/custom_button.dart';
import '../../../../widgets/buttons/social_button.dart';
import '../../../../widgets/selected_indicator.dart';
import '../../home_screen.dart';

const double logoSpaceLeftLg = 40.0;
const double logoSpaceLeftSm = 20.0;
const double logoSpaceRightLg = 70.0;
const double logoSpaceRightSm = 35.0;
const double contactButtonSpaceLeftLg = 60.0;
const double contactButtonSpaceLeftSm = 30.0;
const double contactButtonSpaceRightLg = 40.0;
const double contactButtonSpaceRightSm = 20.0;
const double contactBtnWidthLg = 150.0;
const double contactBtnWidthSm = 120.0;
const int menuSpacerRightLg = 5;
const int menuSpacerRightMd = 4;
const int menuSpacerRightSm = 3;

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.navItems});
  final List<NavItemData> navItems;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    bool spacer = true;
    var textSize = responsiveSize(
      context,
      25.0,
      40.0,
      md: 35.0,
    );
    double logoSpaceLeft =
        responsiveSize(context, logoSpaceLeftSm, logoSpaceLeftLg);
    double logoSpaceRight =
        responsiveSize(context, logoSpaceRightSm, logoSpaceRightLg);
    double contactBtnSpaceLeft = responsiveSize(
      context,
      contactButtonSpaceLeftSm,
      contactButtonSpaceLeftLg,
    );
    double contactBtnSpaceRight = responsiveSize(
      context,
      contactButtonSpaceRightSm,
      contactButtonSpaceRightLg,
    );
    double contactBtnWidth = responsiveSize(
      context,
      contactBtnWidthSm,
      contactBtnWidthLg,
    );
    int menuSpacerRight = responsiveSizeInt(
      context,
      menuSpacerRightSm,
      menuSpacerRightLg,
      md: menuSpacerRightMd,
    );

    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          Shadows.elevationShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: logoSpaceRight),

          Text(
            AppConst.appTextLogo,
            style: GoogleFonts.sedgwickAveDisplay(
              fontSize: textSize,
            ),
          ),
          SizedBox(width: logoSpaceRight),

          const VerticalDivider(color: AppColors.grey100),
          const Spacer(),

          // Image.asset(AppImage.logo),
          ..._buildNavItems(),

          if (spacer) Spacer(flex: menuSpacerRight),

          ResponsiveBuilder(
            refinedBreakpoints: const RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth <
                  (const RefinedBreakpoints().desktopSmall + 450)) {
                return const SizedBox.shrink();
              } else {
                return Row(
                  children: [
                    Row(
                      children: [
                        ..._buildSocialIcons(Data.socialData),
                        // const SizedBox(width: 20),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
          const VerticalDivider(color: AppColors.grey100),
          SizedBox(width: contactBtnSpaceLeft),
          CustomButton(
            buttonTitle: AppConst.contactMe,
            width: contactBtnWidth,
            opensUrl: true,
            url: AppConst.emailUrl,
          ),
          SizedBox(width: contactBtnSpaceRight),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems() {
    return List.generate(widget.navItems.length, (index) {
      List<Widget> items = [];
      items.add(
        NavItem(
          title: widget.navItems[index].name,
          isSelected: widget.navItems[index].isSelected,
          onTap: () => _onTapNavItem(
            context: widget.navItems[index].key,
            navItemName: widget.navItems[index].name,
          ),
        ),
      );
      // if (index != widget.navItems.length - 1) {
      items.add(const Spacer());
      // }
      return items;
    }).expand((widget) => widget).toList();
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.navItems.length; index++) {
      if (navItemName == widget.navItems[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.navItems[index].isSelected = true;
        });
      } else {
        widget.navItems[index].isSelected = false;
      }
    }
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        SocialButton(
          tag: socialItems[index].tag,
          iconData: socialItems[index].iconData,
          onPressed: () => openUrlLink(socialItems[index].url),
        ),
      );
      items.add(const SizedBox(width: 16));
    }
    return items;
  }
}

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.title,
    this.titleStyle,
    this.titleColor = AppColors.black,
    this.isSelected = false,
    this.onTap,
  });
  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final bool isSelected;
  // final bool isMobile;
  final GestureTapCallback? onTap;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    var textSize = responsiveSize(
      context,
      14.0,
      16.0,
      md: 15.0,
    );

    return MouseRegion(
      onEnter: (event) => _mouseEnter(true),
      onExit: (event) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        child: Stack(
          children: [
            if (widget.isSelected)
              const Positioned(
                top: 12,
                child: SelectedIndicator(
                  width: 20,
                  indicatorColor: AppColors.yellow450,
                  height: 6,
                  opacity: 0.85,
                ),
              )
            else
              Positioned(
                top: 12,
                child: AnimatedHoverIndicator(
                  width: 20,
                  isHover: _hovering,
                ),
              ),
            Text(
              widget.title,
              style: widget.titleStyle ??
                  textTheme.titleMedium!.copyWith(
                    color: widget.titleColor,
                    fontSize: textSize,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }
}
