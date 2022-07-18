import 'package:flutter/material.dart';
import 'package:static1/newPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //static variable (can be access from any file1.dart)
  static String var1 = '/NewPage';
  static void fnc(String? s) {
    print(s);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/NewPage': (context) => NewPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  void onPress() {
    Navigator.of(context).pushNamed(MyApp.var1);
  }

  @override
  Widget build(BuildContext context) {
    MyApp.fnc('call static_fnc() from MainPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static'),
      ),
      body: Column(
        children: [
          Text(MyApp.var1),
          ElevatedButton(
            child: const Text('To Next Page'),
            onPressed: onPress,
          ),
        ],
      ),
    );
  }
}
