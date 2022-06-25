import 'package:flutter/material.dart';

class CWidget2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return const Text(
      'World Hello',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        wordSpacing: 40,
        color: Colors.red,

      ),
    );
  }
}
