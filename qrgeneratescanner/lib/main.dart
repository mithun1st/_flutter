import 'package:flutter/material.dart';
import 'package:qrgeneratescanner/screens/generator.dart';
import 'package:qrgeneratescanner/screens/scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      routes: {
        Generator().routeName: (context) => Generator(),
        Scanner().routeName: (context) => Scanner(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*
  install pac from pub.dev

  qr_flutter: ^4.0.0
  qr_code_scanner: ^1.0.0

*/

class _MyHomePageState extends State<MyHomePage> {
  void gPage() {
    Navigator.of(context).pushNamed(Generator().routeName);
  }

  void sPage() {
    Navigator.of(context).pushNamed(Scanner().routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generator/Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //---
            ElevatedButton(
              onPressed: gPage,
              child: Text('Generator'),
            ),
            //---
            ElevatedButton(
              onPressed: sPage,
              child: Text('Scanner'),
            ),
          ],
        ),
      ),
    );
  }
}
