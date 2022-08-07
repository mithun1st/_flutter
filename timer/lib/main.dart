import 'dart:async';

import 'package:flutter/material.dart';

void main() {
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

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int count = 3;

  void fnc1() {
    print('object');
    Timer.periodic(const Duration(seconds: 3), (timer) {
      //count = timer as int;
      setState(() {
        print(count);
        count--;
        if (count < 1) {
          timer.cancel();
          print('Timer Cancel !');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(count.toString()),
            ElevatedButton(
              onPressed: fnc1,
              child: const Text('start'),
            ),
          ],
        ),
      ),
    );
  }
}
