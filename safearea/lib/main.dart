import 'package:flutter/material.dart';

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
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeArea'),
      ),
      //-----------------------
      body: SafeArea(
        child: ListView.builder(itemBuilder: (con, i) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              tileColor: Colors.purple,
              title: Text(i.toString()),
            ),
          );
        }),
      ),
    );
  }
}
