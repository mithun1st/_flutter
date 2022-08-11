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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularProgressIndicator(
              strokeWidth: 8,
            ),
            LinearProgressIndicator(),
            CircularProgressIndicator(
              value: .40,
              backgroundColor: Colors.blue.shade200,
            ),
            LinearProgressIndicator(
              value: .9,
              minHeight: 20,
              semanticsLabel: 'Hello',
              semanticsValue: 'xxxxxxx',
            ),
          ],
        ),
      ),
    );
  }
}
