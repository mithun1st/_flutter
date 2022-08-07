import 'package:flutter/material.dart';
import 'package:pageview/pages/page1.dart';
import 'package:pageview/pages/page2.dart';
import 'package:pageview/pages/page3.dart';

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
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int index = 1;

  PageController pc = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView ${index + 1}'),
      ),
      body: PageView(
        controller: pc,
        scrollDirection: Axis.vertical,
        onPageChanged: (value) => setState(() {
          index = value;
        }),
        children: [
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
    );
  }
}
