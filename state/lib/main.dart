import 'package:flutter/material.dart';

void main() => runApp(MyApp());

//stateless widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('State Example'),
        ),
        body: HomePage(),
      ),
    );
  }
}

//stateful widget
class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

//state
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('1/in general\n2/app state\n3/widget state'),
    );
  }
}
