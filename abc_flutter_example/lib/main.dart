import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test 1'),
        ),
        body: const Text(
          'welcome sunny',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
