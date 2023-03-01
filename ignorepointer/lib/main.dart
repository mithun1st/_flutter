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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppBar')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //---------------------------------ignore poin
          IgnorePointer(
            ignoring: true,
            child: InkWell(
              onTap: () => print('taping...'),
              child: Icon(Icons.radio_button_checked),
            ),
          ),
          IgnorePointer(
              ignoring: false,
              child: ElevatedButton(
                child: Text('tap here'),
                onPressed: () => print('click...'),
              )),
          Center(
            child: null,
          )
          //---------------------------------ignore poin
        ],
      ),
    );
  }
}
