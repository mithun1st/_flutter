import 'package:flutter/material.dart';

class PageE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page E'),
      ),
      body: const Center(
        child: Text(
          'Page Error 404\n(Page Not Found)',
          style: TextStyle(
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
