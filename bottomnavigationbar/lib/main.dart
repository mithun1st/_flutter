import 'package:flutter/material.dart';
import 'package:bottomnavigationbar/page1.dart';
import 'package:bottomnavigationbar/page2.dart';

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

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int indexPage = 01;

  void onAction(int i) {
    setState(() {
      indexPage = i;
    });
  }

  List<Widget> page = [
    Hi(),
    Bye(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: page[indexPage],

      //--------------bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexPage,
        onTap: onAction,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'press long press',
            icon: Icon(Icons.first_page),
            label: 'Hi There',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.last_page),
            label: 'Good Bye',
          ),
        ],
      ),
    );
  }
}
