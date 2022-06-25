import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //const
    const pi = 3.1416;
    
    //final
    final String str1 = 'Mahadi Hassan';
    final String str2;
    str2 = 'Mithun';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('final const'),
        ),
        body: Text('$pi / $str1 / $str2'),
      ),
    );
  }
}
