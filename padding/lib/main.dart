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
        title: const Text('Paddnig'),
      ),
      body: const Padding(
        //padding example
        padding: EdgeInsets.only(
          top: 100,
          left: 40,
        ),
        child: Text('Hello world'),
      ),
    );
  }
}
