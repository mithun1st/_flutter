import 'package:flutter/material.dart';
import 'package:streambuilder/network.dart';

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
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0;
  Stream<int> data() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      return counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(Network().whereIsISSAtt());
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //------------1
          StreamBuilder(
            stream: Network().whereIsISSAtt(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 18),
                );
              }
            },
          ),

          //-------------2
          StreamBuilder(
            stream: data(),
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
          ),
        ],
      ),
    );
  }
}
