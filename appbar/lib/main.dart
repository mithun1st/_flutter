import 'package:flutter/material.dart';
import 'package:appbar/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AB(),
      ),
    );
  }
}

/* 
  appbar has 3 row of positon-
  1st row- leading, title, action[widget1, widget2]
  2nd row- flexiableSpace (add color)
  3rd row- bottom (for like tab)
*/

PreferredSizeWidget AB() {
  return AppBar(
    //
    leading: const Icon(Icons.menu),
    //
    title: const Text('App Bar'),
    centerTitle: true,
    //
    actions: [
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {},
        enableFeedback: true,
      ),
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
    //
    flexibleSpace: Container(
      color: Colors.red,
    ),

    //
    /*bottom: TabBar(tabs: [])*/
  );
}
