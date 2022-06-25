import 'package:flutter/material.dart';

class TextB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => print('on press'),
      onLongPress: () => print('long press'),
      child: const Text('Text Button'),
      
      style: TextButton.styleFrom(
        primary: Colors.red,
      ),
    );
  }
}
