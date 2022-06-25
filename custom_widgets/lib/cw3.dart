import 'package:flutter/material.dart';

class CWidget3 extends StatelessWidget {
  final String str;

  CWidget3( {required this.str});

  Widget build(BuildContext context) {
    return Text(
      str,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 30,
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}
