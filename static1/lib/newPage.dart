import 'package:flutter/material.dart';
import 'package:static1/main.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyApp.fnc('call static_fnc() from NewPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static'),
      ),
      body: Text(MyApp.var1),
    );
  }
}
