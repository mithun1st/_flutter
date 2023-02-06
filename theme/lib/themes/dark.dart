import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  primarySwatch: Colors.pink,
  scaffoldBackgroundColor: Colors.grey.shade900,
  toggleableActiveColor: Colors.teal,

  highlightColor: Colors.blue,
  splashColor: Colors.yellow,

  //font theme
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 22,
      color: Colors.purple,
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      color: Colors.blueGrey,
    ),
  ),
  //appbar theme
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.white,
    color: Colors.black12,
    centerTitle: true,
  ),
  //Icon theme
  iconTheme: const IconThemeData(
    color: Colors.blue,
    size: 40,
  ),
  //
);
