import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/values/values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  //default theme mode
  static const ThemeMode _defaultThemeMode = ThemeMode.light;

  ThemeMode _themeMode = _defaultThemeMode;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode;

  // Future<ThemeMode> themeMode() async => ThemeMode.system;
  static const _lightFillColor = Colors.black;

  // theme is light or dark
  // bool get isLightTheme => _themeMode == ThemeMode.system? ThemeMode.system == ThemeMode.light : false;

  Future<void> getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? theme = sharedPreferences.getString(SPref.themeMode) ??
        _defaultThemeMode.toString();
    print("theme: $theme");
    if (theme == ThemeMode.system.toString()) {
      _themeMode = ThemeMode.system;
      notifyListeners();
    } else if (theme == ThemeMode.light.toString()) {
      _themeMode = ThemeMode.light;
      notifyListeners();
    } else if (theme == ThemeMode.dark.toString()) {
      _themeMode = ThemeMode.dark;
      notifyListeners();
    }
  }

  Future<void> saveMode(ThemeMode themeMode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String theme = themeMode.toString();
    await sharedPreferences.setString(SPref.themeMode, theme);
  }

  // use to toggle the theme
  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Do not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new ThemeMode in memory
    _themeMode = newThemeMode;
    saveMode(newThemeMode);
    notifyListeners();
  }

  // #---------# Theme Data #---------#

  static TextStyle font = GoogleFonts.inter();
  static TextStyle fontIbmPlexMono = GoogleFonts.ibmPlexMono();
  static TextStyle fontGloriaHallelujah = GoogleFonts.gloriaHallelujah();
  static TextStyle fontLato = GoogleFonts.lato();

  static ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    textTheme: textTheme(),
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.secondaryColor,
    secondary: AppColors.primaryColor,
    secondaryContainer: AppColors.primaryColor,
    background: Colors.white,
    surface: Color(0xFFFAFBFB),
    onBackground: AppColors.primaryColor,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  // static const _superBold = FontWeight.w900;
  static const _bold = FontWeight.w700;
  // static const _semiBold = FontWeight.w600;
  // static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static const Color _textColor = AppColors.black;

  static TextStyle fontType = fontIbmPlexMono;

  static TextTheme textTheme() {
    return TextTheme(
      displayLarge: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      displayMedium: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      displaySmall: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      headlineLarge: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      headlineMedium: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      headlineSmall: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      titleLarge: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      titleMedium: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      titleSmall: fontType.copyWith(
        color: _textColor,
        fontWeight: _bold,
      ),
      bodyLarge: fontType.copyWith(
        color: _textColor,
        fontWeight: _regular,
      ),
      bodyMedium: fontType.copyWith(
        color: _textColor,
        fontWeight: _light,
      ),
      bodySmall: fontType.copyWith(
        color: _textColor,
        fontWeight: _light,
      ),
      labelLarge: fontType.copyWith(
        color: _textColor,
        fontWeight: _regular,
      ),
      labelMedium: fontType.copyWith(
        color: _textColor,
        fontWeight: _light,
      ),
      labelSmall: fontType.copyWith(
        color: _textColor,
        fontWeight: _light,
      ),
    );
  }

  // static ThemeData darkTheme = ThemeData(
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: AppColors.greenDark,
  //     primary: AppColors.greenDark,
  //     secondary: AppColors.secondaryColor,
  //     brightness: Brightness.light,
  //   ),
  //   scaffoldBackgroundColor: AppColors.greenDark,
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: AppColors.white,
  //     elevation: 0,
  //     iconTheme: const IconThemeData(color: AppColors.black),
  //     titleTextStyle: font.copyWith(
  //       fontSize: 24,
  //       color: AppColors.black,
  //       fontWeight: FontWeight.w700,
  //     ),
  //     centerTitle: true,
  //   ),
  //   outlinedButtonTheme: OutlinedButtonThemeData(
  //     style: OutlinedButton.styleFrom(
  //       foregroundColor: AppColors.white,
  //       backgroundColor: AppColors.black,
  //       // shape: RoundedRectangleBorder(
  //       //   borderRadius: BorderRadius.circular(10),
  //       // ),
  //     ),
  //   ),
  //   radioTheme: RadioThemeData(
  //     fillColor: MaterialStateProperty.all(AppColors.greenExtraDark),
  //   ),
  //   textButtonTheme: TextButtonThemeData(
  //     style: TextButton.styleFrom(
  //       // primary: AppColors.primaryColor,
  //       textStyle: font.copyWith(
  //         fontSize: 14,
  //         fontWeight: FontWeight.w600,
  //         color: AppColors.white,
  //       ),
  //     ),
  //   ),
  // );
}
