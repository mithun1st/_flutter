import 'package:flutter/material.dart';

class ElevatedB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> print('on press'),
      onLongPress: ()=> print('long press'),
      child: const Text('Elevated Button'),

      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        onPrimary: Colors.yellow,
      ),
    );
  }
}
