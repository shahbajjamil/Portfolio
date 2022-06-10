import 'package:flutter/cupertino.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double multiplyBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).height - reducedBy) * multiplyBy;
}

double screenWidth(BuildContext context, {double multiplyBy = 1, double reducedBy = 0.0}) {
  return (screenSize(context).width - reducedBy) * multiplyBy;
}

double screenHeightExcludingToolbar(BuildContext context, {double multiplyBy = 1, kToolbarHeight = 1.0}) {
  return screenHeight(context, multiplyBy: multiplyBy, reducedBy: kToolbarHeight);
}
