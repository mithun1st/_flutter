import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State {
  int count = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RefreshIndicator')),
      body: RefreshIndicator(
        backgroundColor: Colors.red,
        color: Colors.yellow,
        // strokeWidth: 60,

        //position--------
        // displacement: 200,
        // edgeOffset: 400,
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) => Card(
            margin: EdgeInsets.only(bottom: 8),
            elevation: 12,
            child: Text(index.toString()),
          ),
        ),
        onRefresh: () async {
          print('refresh.....');
          await Future.delayed(Duration(seconds: 3));
          setState(() {
            count++;
          });
        },
      ),
    );
  }
}
