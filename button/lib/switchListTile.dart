import 'package:flutter/material.dart';

class SwitchB extends StatefulWidget {
  @override
  State createState() => _SwitchBState();
}

class _SwitchBState extends State<SwitchB> {
  bool sw = true;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text('Title Line'),
        subtitle: Text('Here is subtitle section'),
        value: sw,
        onChanged: (b) {
          setState(() {
            sw = b;
          });
        });
  }
}
