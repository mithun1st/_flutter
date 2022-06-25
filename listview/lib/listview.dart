import 'package:flutter/material.dart';

class LV extends StatelessWidget {
  List<String>? alphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'c',
    'e',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  //custom widget
  Widget txt(String x) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.grey.shade200,
      child: Text(
        x.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: alphabet!.map((e) => txt(e)).toList(),
    );
  }
}
