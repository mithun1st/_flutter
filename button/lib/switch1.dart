import 'package:flutter/material.dart';

class SwitchA extends StatefulWidget {
  @override
  State createState() => _SwiichAState();
}

class _SwiichAState extends State<SwitchA> {
  bool sw = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: sw,
        onChanged: (b) {
          setState(() {
            sw = b;
          });
        });
  }
}
