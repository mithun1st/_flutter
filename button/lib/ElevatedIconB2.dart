import 'package:flutter/material.dart';

class ElevatedIconB2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Text('Button Icon'),
      label: const Icon(Icons.cloud),
    );
  }
}
