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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),

              //Gradient-------------------------------
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.green,
                  Colors.pink,
                  Colors.purple,
                  Colors.yellow,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),

              //Gradient -------------------------------
              gradient: LinearGradient(
                colors: [
                  Colors.cyan.withOpacity(.2),
                  Colors.cyan,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),

              //Gradient -------------------------------
              gradient: SweepGradient(
                colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.blue,
                  Colors.purple,
                ],
                center: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
