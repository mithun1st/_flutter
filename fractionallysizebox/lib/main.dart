import 'package:flutter/material.dart';

void main() {
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
        title: Text('Fractionally Size Box'),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 40,
        color: Colors.red,
        child: FractionallySizedBox(
          //percent of (var1 / 100)
          heightFactor: .92,
          widthFactor: .4,
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.blue,
          ),
        ));
  }
}
