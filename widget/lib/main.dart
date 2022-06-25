import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  //variable- that wouold to be access from State widget.
  final String? var1 = 'passing value to-\n\'StatefulWidget to State\'';

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  /*
  must have to use this keyword -
  'extends State<StatefulClassName_1>'
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('widget(passing value)')),
      body: Text(widget.var1.toString()),
    );
  }
}
