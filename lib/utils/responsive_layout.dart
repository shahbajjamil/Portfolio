import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget tiny;
  final Widget tablet;
  final Widget phone;
  final Widget largetTablet;
  final Widget computer;

  const ResponsiveLayout({
    Key? key,
    required this.tiny,
    required this.tablet,
    required this.phone,
    required this.largetTablet,
    required this.computer,
  }) : super(key: key);

  static const int tinyHeightLimit = 100;
  static const int tinyLimit = 270;
  static const int phoneLimit = 550;
  static const int tabletLimit = 800;
  static const int largeTabletLimit = 1100;

  static bool isTinyHeightLimit(context) =>
      MediaQuery.of(context).size.height < tinyHeightLimit;

  static bool isTinyLimit(context) =>
      MediaQuery.of(context).size.width < tinyLimit;

  static bool isPhone(context) =>
      MediaQuery.of(context).size.width < phoneLimit &&
      MediaQuery.of(context).size.width >= tinyLimit;

  static bool isTablet(context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= phoneLimit;

  static bool isLargeTablet(context) =>
      MediaQuery.of(context).size.width < largeTabletLimit &&
      MediaQuery.of(context).size.width >= tabletLimit;

  static bool isComputer(context) =>
      MediaQuery.of(context).size.width >= largeTabletLimit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < tinyLimit ||
            constraints.maxHeight < tinyHeightLimit) {
          return tiny;
        }
        if (constraints.maxWidth < phoneLimit) {
          return phone;
        }
        if (constraints.maxWidth < tabletLimit) {
          return tablet;
        }
        if (constraints.maxWidth < largeTabletLimit) {
          return largetTablet;
        } else {
          return computer;
        }
      },
    );
  }
}
