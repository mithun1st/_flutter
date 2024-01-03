import 'dart:isolate';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //## without isolate
  int taskWithOutIsolate(int len) {
    int sum = 0;

    for (int i = 0; i < len; i++) {
      sum += i;
    }
    return sum;
  }


  //## with isolate
  Future<int> taskWithWithIsolate(int len) async {
    ReceivePort receivePort = ReceivePort();

    try {
      Isolate.spawn(heavyTaskWithWithIsolate, [receivePort.sendPort, len]);
    } catch (e) {
      print("Failed: $e");
      receivePort.close();
      return -1;
    }

    var re = await receivePort.first;
    return re;
  }

  int heavyTaskWithWithIsolate(List<dynamic> l) {
    int sum = 0;
    for (int i = 0; i < l[1]; i++) {
      sum += i;
    }

    SendPort sendPort = l[0] as SendPort;
    Isolate.exit(sendPort, sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("isolate"),
        ),
        body: Column(
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
              onPressed: () {
                final int re = taskWithOutIsolate(99999999);
                print("result without isolate: $re");
              },
              child: const Text("Heavy Task Without Isolate"),
            ),
            ElevatedButton(
              onPressed: () async {
                final re = await taskWithWithIsolate(99999999);
                print("result with isolate: $re");
              },
              child: const Text("Heavy Task With Isolate"),
            ),
          ],
        ));
  }
}
