import 'package:flutter/material.dart';

const COLOR_LIGTH_GRAY_BLUE = Color.fromRGBO(232, 235, 246, 1);
const COLOR_BLUE = Color.fromRGBO(59, 92, 184, 1);
const COLOR_GRAY = Color.fromRGBO(96, 99, 119, 1);
const COLOR_LIGTH_GRAY = Color.fromRGBO(154, 163, 188, 1);

ThemeData buildThemeData() {
  return ThemeData(
    primarySwatch: Colors.blue,
    iconTheme: IconThemeData(
      color: COLOR_LIGTH_GRAY,
      size: 24,
    ),
    scaffoldBackgroundColor: COLOR_LIGTH_GRAY_BLUE,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w900,
        color: COLOR_BLUE,
        letterSpacing: 0.75,
        height: 1.2,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: COLOR_GRAY,
        letterSpacing: 0.48,
        height: 1.875,
      ),
      subtitle2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: COLOR_BLUE,
        height: 1.364,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: COLOR_GRAY,
        height: 1.875,
        letterSpacing: 0.48,
      ),
      bodyText2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: COLOR_BLUE,
        letterSpacing: 0.54,
        height: 1.667,
      ),
      button: TextStyle(
        fontSize: 16,
        color: COLOR_BLUE,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.48,
      ),
    ),
  );
}
