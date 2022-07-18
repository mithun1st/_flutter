import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget box1(Color c) {
    return Container(
      height: 100,
      width: 200,
      color: c,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Divider'),
      ),
      body: Column(
        children: [
          box1(Colors.red),
          //------------------------Divider
          const Divider(
            color: Colors.black,
            height: 80,
            thickness: 20,
            indent: 10,
            endIndent: 70,
          ),
          //--
          box1(Colors.blue),
        ],
      ),
    );
  }
}
