import 'package:flutter/material.dart';
import 'c1.dart';
import 'c2.dart';
import 'c3.dart';
import 'c4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        Container1(),
        Container2(),
        Container3(),
        Container4(),
        
      ],
    );
  }
}
