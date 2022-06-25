import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FittedBox'),
      ),
      body: Container(
        //example of FittedBox
        //width: 100, //sw1
        width: 400, //sw2

        //
        height: 50,
        child: const FittedBox(child: Text('abcdefgHello World')),
      ),
    );
  }
}
