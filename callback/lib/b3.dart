import 'package:flutter/material.dart';

class ButtonFnc3 extends StatelessWidget {

  VoidCallback fnc;

  ButtonFnc3(this.fnc);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => fnc(4,6),
      child: const Icon(Icons.call),
    );
  }
}
