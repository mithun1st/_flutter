import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //image 1
      Container(
        height: 200,
        width: 100,
        color: Colors.yellow,
        child: Image.asset(
          "assets/images/bin.png",
          fit: BoxFit.contain,
        ),
      ),
      //image 2
      Container(
        height: 400,
        width: 300,
        color: Colors.grey,
        child: Image.network(
          'https://avatars.githubusercontent.com/u/43158155?v=4',
        ),
      ),
    ]);
  }
}
