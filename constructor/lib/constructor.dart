
import 'package:flutter/material.dart';

class Cls extends StatelessWidget {

  final String str;

  Cls (this.str);
  Cls.newConstructor1(this.str);
  Cls.newConstructor2(this.str);


  @override 
  Widget build (BuildContext context){
    return Text(str);
  }

}
