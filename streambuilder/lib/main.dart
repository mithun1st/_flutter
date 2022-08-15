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
  int counter = 0;
  Stream<int> data() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      return counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: StreamBuilder(
        stream: data(),
        builder: (context, snapshot) {
          return Text(snapshot.data.toString());
        },
      ),
    );
  }
}
