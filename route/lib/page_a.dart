import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page A'),
      ),
      body: const Center(
        child: Text('A'),
      ),
    );
  }
}
