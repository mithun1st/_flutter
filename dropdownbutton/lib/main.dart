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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedValue = 'y';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropdownButton'),
      ),
      body: Center(
        child: Column(
          children: [
            Chip(label: Text(selectedValue.toString())),
            DropdownButton(
              value: selectedValue,
              dropdownColor: Colors.green,
              elevation: 12,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 42,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'x',
                  child: Text('First'),
                ),
                DropdownMenuItem(
                  value: 'y',
                  child: Text('Second'),
                ),
                DropdownMenuItem(
                  value: 'z',
                  child: Text('Thrid'),
                ),
              ],
              onChanged: (value) {
                selectedValue = value.toString();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
