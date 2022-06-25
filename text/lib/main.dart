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
          title: const Text('Text Style'),
        ),
        body: MyAppState(),
      ),
    );
  }
}

class MyAppState extends StatefulWidget {
  @override
  State createState() {
    return HomePage();
  }
}

class HomePage extends State {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        //example 1
        Text(
          'Example 1',
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.yellow,
            fontSize: 42,
            fontWeight: FontWeight.w900,
            height: 2,
            wordSpacing: 9,
            letterSpacing: 5,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),

        //example 2
        //maximum text line fix and if overflow then something
        Text(
          'abcdefghijklmnopqrstuvwxyz',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 20,
          ),
        ),
      ],
    );
  }
}
