import 'package:flutter/material.dart';
import 'main.dart';

class CText1 extends StatelessWidget {

  String s=MyApp().str3;
  
  //private variable can't accessed by other file.dart (like bellow)
  //String s1=MyApp()._str1;

  Widget build(BuildContext context) {
    return Text(s);
  }
}
