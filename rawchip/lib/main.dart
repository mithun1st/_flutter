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
  bool rawChip = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Raw Chip')),
      body: RawChip(
        avatar: Icon(Icons.person),
        label: Text('Hello WOrld'),
        backgroundColor: Colors.orange,
        // onPressed: () => print('press...'),
        selected: rawChip,
        onSelected: (value) {
          setState(() {
            rawChip = value;
          });
        },
        onDeleted: () => print('delete'),
        deleteIcon: Icon(Icons.delete),
        deleteButtonTooltipMessage: 'Deleted !',
      ),
    );
  }
}
