import 'package:flutter/material.dart';

import '../../utilities/color_utils.dart';
import 'app_css.dart';

enum ThemeType {
  light,
  dark,
}

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color txt;
  Color primary;
  Color secondary;
  Color accentTxt;
  Color bg1;
  Color surface;
  Color error;

  //Extra Colors
  Color bgGray;
  Color grey;
  Color darkGray;
  Color lightGray;
  Color secondaryGray;
  Color borderGray;
  Color green;
  Color red;
  Color white;
  Color black;
  Color grayPrimary;
  Color graySecondary;
  Color linear;
  Color gray6;
  Color statusColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.txt,
    required this.primary,
    required this.secondary,
    required this.accentTxt,
    required this.bg1,
    required this.surface,
    required this.error,
    //Extra
    required this.bgGray,
    required this.grey,
    required this.darkGray,
    required this.lightGray,
    required this.secondaryGray,
    required this.borderGray,
    required this.green,
    required this.red,
    required this.white,
    required this.black,
    required this.grayPrimary,
    required this.graySecondary,
    required this.linear,
    required this.gray6,
    required this.statusColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          txt: const Color(0xFF1D1F22),
          primary: const Color(0xFF5ECE7B),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          bg1: Colors.white,
          surface: Colors.white,
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFFF0F8FD),
          grey: const Color(0xFFF1F2F3),
          darkGray: const Color(0xFF666666),
          lightGray: const Color(0xFFDFDFDF),
          secondaryGray: const Color(0xFFBEBFC4),
          borderGray: const Color(0xFFE6E8EA),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          black: Colors.black,
          red: Colors.red,
          grayPrimary: const Color(0xFFA3A5AD),
          graySecondary: const Color(0xFFF9F9F9),
          linear: const Color(0xFFF0F4F3),
          gray6: const Color(0xFFF2F2F2),
          statusColor: const Color(0xFFB7791D),

        );

      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          txt: Colors.white,
          primary: const Color(0xFF5ECE7B),
          secondary: const Color(0xFF6EBAE7),
          accentTxt: const Color(0xFF001928),
          bg1: const Color(0xFF151A1E),
          surface: const Color(0xFF151A1E),
          error: const Color(0xFFd32f2f),
          //Extra
          bgGray: const Color(0xFF14232E),
          //bgGray: const Color(0xFF262F36),
          grey: const Color(0xFFF1F2F3),
          darkGray: const Color(0xFF999999),
          lightGray: const Color(0xFF999999),
          secondaryGray: const Color(0xFFBEBFC4),
          borderGray: const Color(0xFF353C41),
          green: const Color(0xFF5CB85C),
          white: Colors.white,
          black: Colors.white,
          red: Colors.red,
          grayPrimary: const Color(0xFFA3A5AD),
          graySecondary: const Color(0xFFF9F9F9),
          linear: const Color(0xFFF0F4F3),
          gray6: const Color(0xFFF2F2F2),
          statusColor: const Color(0xFFB7791D),
          //white: const Color(0xFF262F36),
        );
    }
  }

  ThemeData get themeData {
    var t = ThemeData(
      fontFamily: 'Raleway',
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        // ignore: deprecated_member_use
        primaryVariant: shiftHsl(primary, -.2),
        secondary: secondary,
        // ignore: deprecated_member_use
        secondaryVariant: shiftHsl(secondary, -.2),
        background: bg1,
        surface: surface,
        onBackground: txt,
        onSurface: txt,
        onError: txt,
        onPrimary: accentTxt,
        onSecondary: accentTxt,
        error: error,
      ),
    );
    return t.copyWith(

      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Insets.i5))),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: borderGray,
        selectionHandleColor: Colors.transparent,
        cursorColor: primary,
      ),
      // ignore: deprecated_member_use
      buttonColor: primary,
      highlightColor: primary,
      toggleableActiveColor: primary,
    );
  }

  Color shift(Color c, double d) => shiftHsl(c, d * (isDark ? -1 : 1));
}
