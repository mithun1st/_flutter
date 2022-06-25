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
        title: const Text('CircleAvater'),
      ),
      //example of circle avater
      body: const CircleAvatar(
        backgroundColor: Colors.yellow,
        radius: 40,
        child: Icon(Icons.person),
      ),
    );
  }
}
