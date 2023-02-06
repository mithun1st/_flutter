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
enum Level {
  low(10),
  mid(20),
  high(30);

  final int value;
  const Level(this.value);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //enum
    print(Level.high.value);
    Level level = Level.mid;
    print(level == Level.high);
    print(level == Level.mid);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enum'),
      ),
      body: Text('Hi'),
    );
  }
}
