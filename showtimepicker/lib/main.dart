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
  TimeOfDay? td;

  //void fnc()
  void fnc() {
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      //
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        td = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('showTimePicker'),
      ),
      body: Row(
        children: [
          ElevatedButton(
            onPressed: () => fnc(),
            child: const Text('Pick Time'),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: FittedBox(child: Text('Value Is: $td ${td!.period}\t')),
          )
        ],
      ),
    );
  }
}
