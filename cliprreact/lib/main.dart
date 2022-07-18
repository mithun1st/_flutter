import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClipRRect'),
      ),
      body: Column(
        children: [
          //1
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Icon(
                Icons.sunny,
                color: Colors.amber,
                size: 72,
              ),
            ),
          ),
          //2
          ClipOval(
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.purple,
              child: Icon(
                Icons.sunny,
                color: Colors.orange,
                size: 100,
              ),
            ),
          ),
          //3
          ClipPath(
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 200,
              width: 200,
              color: Colors.purple,
              child: Icon(
                Icons.sunny,
                color: Colors.orange,
                size: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
