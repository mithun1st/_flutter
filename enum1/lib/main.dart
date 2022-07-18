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

//ENUM example
enum level {
  Low,
  Mid,
  High,
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //enum
    level? l;
    l = level.Low;
    print(l == level.Mid);
    l = level.Mid;
    print(l == level.Mid);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enum'),
      ),
      body: Text('Hi'),
    );
  }
}
