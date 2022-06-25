import 'package:flutter/material.dart';
import 'package:listview/listview.dart';
import 'package:listview/listview_build.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: Colors.black,
            ),
          ),
          //List View
          child: LV(),
        ),
        Container(
          height: 250,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: Colors.black,
            ),
          ),
          //List View . Build
          child: LVB(),
        ),
      ],
    );
  }
}
