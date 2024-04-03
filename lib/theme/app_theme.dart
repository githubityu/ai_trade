import 'package:ai_trade/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:ai_trade/gen/export_gen.dart';

import 'exports_theme.dart';

class AppTheme {
  static final Color _lightFocusColor = ColorName.themeColor.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      useMaterial3: true,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      colorScheme: colorScheme,
      focusColor: focusColor,
      // textTheme: GoogleFonts.assistantTextTheme(_textTheme),
      textTheme: _textTheme,
      //web使用 就不用去下载字体了
       fontFamily: 'NotoSansSC',
      extensions: [OtherTheme()],
      segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.grey, width: 1))),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              elevation: const MaterialStatePropertyAll(0),
              minimumSize: const MaterialStatePropertyAll(Size(50, 35)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.black;
                }
                return Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return Colors.black;
              }))),
      dividerTheme: DividerThemeData(color: Colors.grey.withOpacity(0.3)),
      listTileTheme: const ListTileThemeData(),
      tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.zero, labelColor: ColorName.themeColor),
      iconTheme: const IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: colorScheme.primary),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              minimumSize: const MaterialStatePropertyAll(Size(64, 45)),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return ColorName.themeColor;
              }))),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ColorScheme lightColorScheme =
      ColorScheme.fromSeed(seedColor: ColorName.themeColor, error: Colors.red);

  static ColorScheme darkColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.white).copyWith();

  static final TextTheme _textTheme = const TextTheme(
    bodySmall: TextStyle(
        fontSize: 12, color: ColorName.textColor9494AD),
  ).apply(
    fontSizeFactor: 1,
  );
}
