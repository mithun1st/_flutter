import 'package:flutter/material.dart';

class TF5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Document',
          hintText: 'type here...',
        ),
        maxLines: 3,
      ),
    );
  }
}
