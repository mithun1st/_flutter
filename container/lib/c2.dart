import 'package:flutter/material.dart';

class Container2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Hello World'),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(
        left: 40,
        right: 10,
        top: 20,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
    );
  }
}
