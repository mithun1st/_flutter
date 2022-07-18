import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  static const String routeName = '/pageD';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page D'),
      ),
      body: const Center(
        child: Text('D'),
      ),
    );
  }
}
