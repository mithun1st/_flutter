import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  List<Widget> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wrap')),
      body: Column(
        children: [
          //wrap
          Wrap(children: list),
          //----
          ElevatedButton(
              onPressed: () {
                list.add(RawChip(label: Text((list.length + 1).toString())));
                setState(() {});
              },
              child: Text('ADD')),
        ],
      ),
    );
  }
}
