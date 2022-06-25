import 'package:flutter/material.dart';

class ButtonFnc2 extends StatelessWidget {

  Function fnc;

  ButtonFnc2(this.fnc);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => fnc(4,6),
      child: const Icon(Icons.call),
    );
  }
}
