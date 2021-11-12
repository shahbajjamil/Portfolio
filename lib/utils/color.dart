import 'dart:ui';

import 'package:flutter/material.dart';

const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color primaryColor = Color(0xfff260c1);
const Color secondaryColor = Color(0xffAAF0FF);
const Color red = Color(0xffCF4744);
const Color lightBlue = Color(0xffD0FFFF);
const Color lightPink = Color(0xffFFD1EF);
// const Color bgColor = Color(0xffd4c9ff);
// const Color bgColor2 = Color(0xffe0d9ff);

class Palette {
  static const MaterialColor myColor = MaterialColor(
    0xfff260c1, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfff260c1), //10%
      100: Color(0xfff370c7), //20%
      200: Color(0xfff580cd), //30%
      300: Color(0xfff690d4), //40%
      400: Color(0xfff7a0da), //50%
      500: Color(0xfff9b0e0), //60%
      600: Color(0xfffabfe6), //70%
      700: Color(0xfffbcfec), //80%
      800: Color(0xfffcdff3), //90%
      900: Color(0xfffeeff9), //100%
    },
  );
} // y
