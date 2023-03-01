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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InteractiveViewer')),
      body: Container(
        height: 150,
        width: double.infinity,
        color: Colors.yellow,
        child: InteractiveViewer(
          maxScale: 10,
          minScale: .1,
          boundaryMargin: EdgeInsets.all(double.infinity),
          child: Container(
            color: Colors.orange,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.flutter_dash,
                ),
                Text('Zoom IN/OUT or Drag')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
