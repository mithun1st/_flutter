import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  primarySwatch: Colors.amber,
  scaffoldBackgroundColor: Colors.blue.shade100,
  toggleableActiveColor: Colors.green,

  highlightColor: Colors.blue,
  splashColor: Colors.black,
  //font theme
  textTheme: const TextTheme(
    titleSmall: TextStyle(
      fontSize: 22,
      color: Colors.indigo,
    ),
    titleLarge: TextStyle(
      fontSize: 28,
      color: Colors.brown,
    ),
  ),
  //appbar theme
  appBarTheme: const AppBarTheme(
    foregroundColor: Colors.red,
    color: Colors.deepPurple,
    centerTitle: true,
  ),
  //Icon theme
  iconTheme: const IconThemeData(
    color: Colors.purple,
    size: 40,
  ),
  //
);
