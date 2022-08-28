import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  HttpServer? hServer;
  String? wifiIP;
  int port = 1122;
  int count = 0;

  Future<dynamic> httpServer() async {
    //wifiIP = await NetworkInfo().getWifiIP();
    hServer = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    return hServer;
  }

  openServer(String data) async {
    await for (HttpRequest hs in hServer!) {
      hs.response.write(data);
      hs.response.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Server'),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: httpServer(),
            builder: (context, snapshot) {
              //print(snapshot.data.runtimeType);
              //HttpServer hs = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading');
              } else {
                //return Text('Got');
                return Text(
                    'http://${hServer!.address.address}:${hServer!.port}');
              }
            },
          ),
          ElevatedButton(
            child: Text('Hit'),
            onPressed: () async {
              await openServer(count.toString());
              count++;

              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
