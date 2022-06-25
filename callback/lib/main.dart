import 'package:flutter/material.dart';
import 'b1.dart';
import 'b2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  void fnc1() {
    print('Function Without Parameter');
  }


  void fnc2(int a, int b) {
    print('Function With Parameter: ${a+b}');
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Callback Function'),
        ),
        body: Column(
          children: [
            //----------------call back
            ButtonFnc1(fnc1),
            ButtonFnc2(fnc2),
            ButtonFnc2(fnc1),
          ],
        ),
      ),
    );
  }
}
