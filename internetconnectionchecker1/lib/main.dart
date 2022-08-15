import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
bool isInternet = false;
late StreamSubscription sSub;

//-----------------check by button
  Future<bool> check() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('Internet Connected.');
    } else {
      print('No internet!');
    }
    return false;
  }

  @override
  void initState() {
    //----------------automatic checking
    sSub=InternetConnectionChecker().onStatusChange.listen((status) {
      setState(() {
        status == InternetConnectionStatus.connected
            ? isInternet = true
            : isInternet = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    sSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    check();

    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connection Checker'),
      ),
      body: Center(
        child: isInternet? const Text(
          'Internet Available',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ):const Text(
          'No Internet',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
