import 'package:flutter/material.dart';

class Stateless extends StatelessWidget {
  Stateless() {
    print('constructor()');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
      ),
      body: Text('hi'),
    );
  }
}
