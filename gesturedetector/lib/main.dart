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
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String str = 'Click Here \\/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector'),
      ),
      body: Column(
        children: [
          Text(
            str,
            style: TextStyle(fontSize: 50),
          ),
          //gesture detector
          GestureDetector(
            onTap: () => setState(() {
              str = 'Single Tap';
            }),
            onDoubleTap: () => setState(() {
              str = 'Double Tap';
            }),
            onLongPress: () => setState(() {
              str = 'Long Press';
            }),
            
            child: Container(
              height: 100,
              width: 200,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
