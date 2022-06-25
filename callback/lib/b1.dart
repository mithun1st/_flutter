import 'package:flutter/material.dart';

class ButtonFnc1 extends StatelessWidget {
  
  Function() fnc;

  ButtonFnc1(this.fnc);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: fnc,
      child: const Icon(Icons.call_end),
    );
  }
}
