import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Widget box1() {
    return Container(
      height: 250,
      width: 300,
      color: Colors.blue,
    );
  }

  Widget box2() {
    return Container(
      height: 150,
      width: 250,
      color: Colors.red,
    );
  }

  Widget box3() {
    return Container(
      height: 100,
      width: 150,
      color: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
      ),
      //--------------Stack
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          box1(),
          Positioned(
            right: -20,
            bottom: -20,
            child: box2(),
          ),
          Positioned(
            bottom: 20,
            child: box3(),
          ),
        ],
      ),
    );
  }
}
