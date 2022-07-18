import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to New Page',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
