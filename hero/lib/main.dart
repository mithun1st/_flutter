import 'package:flutter/material.dart';
import 'package:hero/second_page.dart';

void main(List<String> args) {
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

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Hero Widget'),
      actions: [
        Hero(
          tag: 'tag-1',
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ));
              },
              icon: Icon(Icons.settings)),
        ),
      ],
    ));
  }
}
