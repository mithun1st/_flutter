import 'package:flutter/material.dart';

class ElevatedIconB1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: const Text('Icon Button'),
      icon: const Icon(Icons.cloud),
    );
  }
}
