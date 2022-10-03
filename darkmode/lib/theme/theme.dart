import 'package:flutter/material.dart';

bool isDark = false;
Color FONTCOLOR1 = isDark ? Colors.blue : Colors.green;

class MyThemeData {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData dartTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    focusColor: Colors.red,
    primaryColor: Colors.red,
    primaryColorDark: Colors.red,
    primaryColorLight: Colors.red,
  );
}
