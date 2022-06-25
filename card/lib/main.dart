import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card')),
        body: Column(
          children: [
            //card 1
            Card(
              child: Text("Hi There"),
              color: Colors.red,
            ),

            //card 2
            Card(
              child: Text('Hello World'),
              elevation: 10,
            ),

            //card 3
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('card inside the container'),
              ),
            ),

            //card 4
            Card(
              child: Container(
                child: Text('container inside the card'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
