import 'package:flutter/material.dart';
import 'constructor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Constructor'),
        ),
        body: Column(
          children: [


            //----------------------Constructor
            Cls('configure 0'),
            Cls.newConstructor1('configure 1'),
            Cls.newConstructor2('configure 2'),



          ],
        ),
      ),
    );
  }
}
