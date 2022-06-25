import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible'),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          fit: FlexFit.loose, //default setting
          //FlexFit.loose listen to- height/width value, if h/w exist,
          child: Container(
            //height: 10,
            width: double.infinity,
            color: Colors.red,
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          //FlexFit.tight always listen to- flex value,
          child: Container(
            height: 400000,
            width: double.infinity,
            color: Colors.green,
          ),
        ),
        Container(
          height: 30,
          width: double.infinity,
          color: Colors.blue,
        ),
      ],
    );
  }
}
