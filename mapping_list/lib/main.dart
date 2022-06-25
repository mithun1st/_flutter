import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List l1 = ['one', 'two', 'three'];
  List l2 = ['apple', 'ball', 'cat'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mapping List'),
        ),
        body: Column(
          children: [
            //type 1
            ...l1.map((e) {
              return Text(e);
            }).toList(),

            //type 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: l2.map((e) {
                return Text('\t$e');
              }).toList(),
            ),

            //type 3
            Column(
              children: l1.map((e) => Text(e)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
