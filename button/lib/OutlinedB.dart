import 'package:flutter/material.dart';

class OutlinedB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: ()=> print('on press'),
      onLongPress: ()=> print('long press'),
      child: const Text('Outlined Button'),
      
      style: OutlinedButton.styleFrom(
        primary: Colors.red,
      ),
    );
  }
}
