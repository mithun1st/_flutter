import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

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

class HomePageState extends State {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
      ),
      body: Badge(
        badgeContent: Text(i.toString()),
        position: BadgePosition.bottomEnd(),
        animationType: BadgeAnimationType.scale,
        child: Card(
          color: Colors.purple,
          child: IconButton(
              onPressed: () {
                i++;
                setState(() {});
              },
              icon: const Icon(
                Icons.call,
                size: 20,
              )),
        ),
      ),
    );
  }
}
