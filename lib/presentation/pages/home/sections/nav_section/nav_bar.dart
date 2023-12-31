import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/values/app_images.dart';

import '../../../../../values/values.dart';
import '../../home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.navItems});
  final List<NavItemData> navItems;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var textSize = responsiveSize(
      context,
      25.0,
      48.0,
      md: 40.0,
    );
    return Container(
      height: 100,
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppConst.appTextLogo,
            style: GoogleFonts.sedgwickAveDisplay(
              fontSize: textSize,
            ),
          ),
          // Image.asset(AppImage.logo),
          ...List.generate(widget.navItems.length, (index) {
            return NavItem(
              title: widget.navItems[index].name,
              isSelected: widget.navItems[index].isSelected,
            );
          }),
        ],
      ),
    );
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
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    var textSize = responsiveSize(
      context,
      14.0,
      16.0,
      md: 15.0,
    );

    return InkWell(
      onTap: widget.onTap,
      child: Text(
        widget.title,
        style: widget.titleStyle ??
            textTheme.titleMedium!.copyWith(
              color: widget.titleColor,
              fontSize: textSize,
            ),
      ),
    );
  }
}
