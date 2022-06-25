import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Single Child Scroll View'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  List<String>? alphabet = [
    'a',
    'b',
    'c',
    'd',
    'c',
    'e',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  //custom widget
  Widget txt(String x) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Text(
        x.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //single child scroll view
    return SingleChildScrollView(
      child: Column(
        children: alphabet!.map((e) => txt(e)).toList(),
      ),
    );
  }
}
