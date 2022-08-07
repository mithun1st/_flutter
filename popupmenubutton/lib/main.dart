import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void fnc1() {
    print('one');
  }

  void fnc2() {
    print('two');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopUPMenuBar'),
        actions: [
          //------------------------------

          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('About'),
                value: 'value 1',
                onTap: fnc1,
              ),
              PopupMenuItem(
                child: Text('Setting'),
                value: 'value 2',
                onTap: fnc2,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text('PopUpMenuButton'),
      ),
    );
  }
}
