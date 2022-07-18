import 'package:flutter/material.dart';
import 'cw2.dart';
import 'cw3.dart';
import 'cw4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget CWidget1() {
    return const Text('Hello World');
  }

  List<Widget> widFnc() {
    return [Text('Mithun'), CWidget2()];
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widget'),
        ),
        body: Column(
          children: [
            //list of custom widget
            CWidget1(),
            CWidget2(),
            CWidget3(str: 'Mahadi Hassan'),
            CWidget4(),
            ...widFnc(),
          ],
        ),
      ),
    );
  }
}
