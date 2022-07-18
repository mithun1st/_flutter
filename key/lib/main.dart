import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
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
  HomePage({Key? k}) : super(key: k) {
    print("Key");
  }

  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool con = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Key')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //
              if (con)
                TextField(
                  //value key
                  key: UniqueKey(),
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  controller: TextEditingController(
                    text: 'Hello World',
                  ),
                ),
              //

              TextField(
                //value key
                key: UniqueKey(),
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              //
              ElevatedButton(
                onPressed: () => setState(() {
                  con = false;
                }),
                child: Text(
                  'delete widget'.toUpperCase(),
                ),
              ),
              //
            ],
          ),
        ));
  }
}
