import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //variable
    String str1 = '12';
    String str2 = '3.14';

    int str1var;
    double str2var;

    int num1 = 11;
    double num2 = 2.2;

    String num1var;
    String num2var;

    //convert String to Number
    str1var = int.parse(str1);
    str2var = double.parse(str2);

    //convert Number to String
    num1var = num1.toString();
    num2var = num2.toString();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Convert Datatype'),
        ),
        body: Center(
          child: Text('$str1var | $str2var | $num1var | $num2var'),
        ),
      ),
    );
  }
}
