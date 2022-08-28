import 'package:flutter/material.dart';
import 'package:chart/item.dart';
import 'package:chart/chart.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  //---------------------
  List<Item> itemList = [
    Item(
      name: 'xmi',
      price: 13.11,
      dt: DateTime.utc(1994, 10, 30, 12, 30, 2),
    ),
    Item(
      name: 'iphn',
      price: 50.11,
      dt: DateTime.utc(2002, 5, 13, 12, 30, 2),
    ),
    Item(
      name: 'pc',
      price: 80.11,
      dt: DateTime.utc(2002, 3, 14, 12, 30, 2),
    ),
    Item(name: 'a', price: 20.11, dt: DateTime.now()),
  ];

  void addItem(String i, double p, DateTime d) {
    itemList.add(Item(name: i, price: p, dt: d));
  }
  //---------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widget- Chart'),
      ),
      body: Chart(itemList),
    );
  }
}
