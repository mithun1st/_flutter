import 'package:flutter/material.dart';
import 'package:private_variable/cls.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // underscore symbol '_' use to make variable private.
  //can be access from own file (like- file.dart) .
  final String _str1 = 'Mahadi Hassan';
  final String _str2 = 'MH Mithun';
  final String str3 = 'Public Variable';

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('private modifier'),
        ),
        body: Column(
          children: [

            //print variable
            Text(_str1),
            CText(),
            CText1(),
          ],
        ),
      ),
    );
  }
}

class CText extends StatelessWidget {

  String s=MyApp()._str2;

  Widget build(BuildContext context) {
    return Text(s);
  }
}
