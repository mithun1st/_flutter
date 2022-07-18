import 'package:flutter/material.dart';

void main(List<String> args) {
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
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      //-------------------Drawer
      drawer: Drawer(
        backgroundColor: Colors.lightBlue.shade100,
        elevation: 40,
        semanticLabel: 'xxxxxxx',
        width: 200,
        shape: Border.all(
          width: 4,
          color: Colors.red,
        ),
        child: const Center(
          child: Text('LEFT'),
        ),
      ),
      //--
      endDrawer: Drawer(
        child: Center(
          child: ElevatedButton(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      //--
      onDrawerChanged: (b) {
        print('L  $b');
      },
      onEndDrawerChanged: (b) {
        print('R  $b');
      },
      //--------------------
      body: Center(
        child: Drawer(
          backgroundColor: Colors.brown.shade100,
          child: Text('Drawer Example'),
        ),
      ),
    );
  }
}
