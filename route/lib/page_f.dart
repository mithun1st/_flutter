import 'package:flutter/material.dart';

class PageF extends StatelessWidget {
  static const String routeName = '/pageF';

  TextEditingController c1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    c1.text = 'hello world 3.1416';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page F'),
      ),
      body: Column(
        children: [
          TextField(
            controller: c1,
            decoration: InputDecoration(labelText: 'Type Here'),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop(c1.text);
              },
              icon: Icon(Icons.arrow_back, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
