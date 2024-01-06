import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/presentation/layout/adaptive.dart';
import 'package:portfolio/utils/functions.dart';
import 'package:portfolio/values/app_images.dart';
import 'package:portfolio/values/values.dart';

import 'nav_item.dart';

const kSpacing20 = Sizes.SIZE_20;

class AppDrawer extends StatefulWidget {
  final Color color;
  final double? width;
  final List<NavItemData> menuList;
  final GestureTapCallback? onClose;

  const AppDrawer({
    super.key,
    this.color = AppColors.black200,
    this.width,
    required this.menuList,
    this.onClose,
  });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    double defaultWidthOfDrawer = responsiveSize(
      context,
      assignWidth(context, 0.85),
      assignWidth(context, 0.60),
      md: assignWidth(context, 0.60),
    );
    return SizedBox(
      width: widget.width ?? defaultWidthOfDrawer,
      child: Drawer(
        child: Container(
          color: widget.color,
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Image.asset(
                  //     ImagePath.LOGO_LIGHT,
                  //     height: Sizes.HEIGHT_52,
                  //   ),
                  // ),
                  const Spacer(),
                  InkWell(
                    onTap: widget.onClose ?? () => _closeDrawer(),
                    child: const Icon(
                      Icons.close,
                      size: Sizes.ICON_SIZE_30,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              ..._buildMenuList(
                context: context,
                menuList: widget.menuList,
              ),
              const Spacer(flex: 6),
              _buildFooterText(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> menuItems = [];
    for (var i = 0; i < menuList.length; i++) {
      menuItems.add(
        NavItem(
          onTap: () => _onTapNavItem(
            context: menuList[i].key,
            navItemName: menuList[i].name,
          ),
          title: menuList[i].name,
          isMobile: true,
          isSelected: menuList[i].isSelected,
          titleStyle: textTheme.bodyLarge?.copyWith(
            color:
                menuList[i].isSelected ? AppColors.primary200 : AppColors.white,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight:
                menuList[i].isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
      menuItems.add(const Spacer());
    }
    return menuItems;
  }

  _onTapNavItem({
    required GlobalKey context,
    required String navItemName,
  }) {
    for (int index = 0; index < widget.menuList.length; index++) {
      if (navItemName == widget.menuList[index].name) {
        scrollToSection(context.currentContext!);
        setState(() {
          widget.menuList[index].isSelected = true;
        });
        _closeDrawer();
      } else {
        widget.menuList[index].isSelected = false;
      }
    }
  }

  _closeDrawer() {
    context.pop();
  }

  Widget _buildFooterText() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodySmall?.copyWith(
      color: AppColors.primaryText2,
      fontWeight: FontWeight.bold,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SelectableText.rich(
            TextSpan(
              text: "${AppConst.RIGHTS_RESERVED} ",
              style: footerTextStyle,
              children: [
                const TextSpan(text: "${AppConst.DESIGNED_BY} "),
                TextSpan(
                  text: AppConst.WEB_GENIUS_LAB,
                  style: footerTextStyle?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "${AppConst.BUILT_BY} ",
                style: footerTextStyle,
                children: [
                  TextSpan(
                    text: "${AppConst.DAVID_COBBINA}. ",
                    style: footerTextStyle?.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppConst.MADE_IN_GHANA, style: footerTextStyle),
            const SizedBox(width: Sizes.WIDTH_4),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset(
                AppImage.logo,
                width: Sizes.WIDTH_16,
                height: Sizes.HEIGHT_16,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: Sizes.WIDTH_4),
            Text(AppConst.WITH_LOVE, style: footerTextStyle),
            const SizedBox(width: Sizes.WIDTH_4),
            const Icon(
              FontAwesomeIcons.solidHeart,
              color: AppColors.red,
              size: Sizes.ICON_SIZE_12,
            ),
          ],
        ),
      ],
    );
  }
}
