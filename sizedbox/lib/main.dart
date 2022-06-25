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
        title: const Text('SizedBox'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
          //SizedBox create a empty space on screen
          const SizedBox(
            height: 20,
            width: 40,
          ),
          //

          Container(
            height: 100,
            width: 200,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
