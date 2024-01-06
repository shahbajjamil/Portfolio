import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/values/values.dart';

class NavBarMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBarMobile({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    var logoTextSize = responsiveSize(
      context,
      25.0,
      40.0,
      md: 35.0,
    );
    return Container(
      height: Sizes.HEIGHT_100,
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_30,
        vertical: Sizes.PADDING_30,
      ),
      child: Row(
        children: [
          // const SizedBox(width: Sizes.WIDTH_30),
          IconButton(
            icon: const Icon(
              FeatherIcons.menu,
              color: AppColors.black,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Text(
              AppConst.appTextLogo,
              style: GoogleFonts.sedgwickAveDisplay(
                fontSize: logoTextSize,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
