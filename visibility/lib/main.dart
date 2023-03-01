import 'package:flutter/material.dart';

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
    return _HomePageState();
  }
}

class _HomePageState extends State {
  bool showAdd = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Visibility')),
        body: Column(
          children: [
            //---------------------------------Visible
            Visibility(visible: showAdd, child: Text('SHow Add')),
            Switch(
              value: showAdd,
              onChanged: (value) {
                setState(() {
                  showAdd = value;
                });
              },
            ),
          ],
        ));
  }
}
