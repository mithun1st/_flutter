import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:encrypt1/key_class.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crypto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  
                  List<int> e = utf8.encode('mithun');
                  print(e);
                  String d = utf8.decode([109, 105, 116, 104, 117, 110]);
                  print(d);
                },
                child: Text('utf8'))
          ],
        ),
      ),
    );
  }
}
