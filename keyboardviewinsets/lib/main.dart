import 'package:flutter/material.dart';

void main(List<String> args) {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewInsets'),
      ),
      body: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return SingleChildScrollView(
                  child: Container(
                    color: Colors.blue,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(
                      top: 40,
                      left: 10,
                      right: 10,
                      // this line adding some padding space on bottom
                      //Keybort View Insets
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    child: const Card(
                      color: Colors.grey,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Field',
                          hintText: 'type . . .',
                          fillColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Text('Tap Here'),
      ),
    );
  }
}
