import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  //Orientation controll
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    //DeviceOrientation.portraitDown,
  ]);

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
  Widget build(BuildContext context) {
    //Orientation detected
    bool var1 = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Orientation'),
      ),
      body: Center(
        child: Text(var1.toString()),
      ),
    );
  }
}
