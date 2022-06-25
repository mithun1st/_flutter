import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  DateTime? dt;

  //void fnc()
  void fnc() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      setState(() {
        dt = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('showDatePicker'),
      ),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () => fnc(),
            child: const Text('Select Date'),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: FittedBox(child: Text('Value Is: $dt')),
          )
        ],
      ),
    );
  }
}
