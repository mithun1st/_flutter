import 'package:flutter/material.dart';
import 'package:textfield/tf1.dart';
import 'package:textfield/tf2.dart';
import 'package:textfield/tf3.dart';
import 'package:textfield/tf4.dart';
import 'package:textfield/tf5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Field'),
        ),
        body: _HomePage(),
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TF1(),
          const SizedBox(
            height: 10,
          ),
          TF2(),
          const SizedBox(
            height: 10,
          ),
          TF3(),
          const SizedBox(
            height: 10,
          ),
          TF4(),
          const SizedBox(
            height: 10,
          ),
          TF5(),
        ],
      ),
    );
  }
}
