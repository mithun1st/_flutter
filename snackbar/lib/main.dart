import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Widget Wid1() {
    return Container(
      color: Colors.red,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.message),
          Text('Hi, I\'m a SnackBar !'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnakBar'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: const Text('Hit'),
            onPressed: () {
              //------------------------snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Press Button',
                    onPressed: () {
                      print('you Click Snack Bar');
                    },
                  ),
                  backgroundColor: Colors.grey,
                  content: Wid1(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
