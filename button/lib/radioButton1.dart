import 'package:flutter/material.dart';

class Radio1 extends StatefulWidget {
  @override
  State<Radio1> createState() => _Radio1State();
}

class _Radio1State extends State<Radio1> {
  String rg = 'Off';
  var col = Colors.black;
  Color c = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: 'On',
          groupValue: rg,
          onChanged: (c) {
            setState(() {
              rg = c.toString();
              print(c);
            });
          },
        ),
        Radio(
          value: 'Off',
          groupValue: rg,
          onChanged: (c) {
            setState(() {
              rg = c.toString();
              print(c);
            });
          },
        ),
        //------------------------------
        Container(
          height: 20,
          width: 60,
          color: col,
        ),
        Radio(
          value: Colors.red,
          groupValue: col,
          onChanged: (c) {
            setState(
              () {
                col = c as Color;
                print(col.toString());
              },
            );
          },
        ),
        Radio(
          value: Colors.green,
          groupValue: col,
          onChanged: (c) {
            setState(
              () {
                col = c as Color;
                print(col.toString());
              },
            );
          },
        ),
        Radio(
          value: Colors.blue,
          groupValue: col,
          onChanged: (c) {
            setState(
              () {
                col = c as Color;
                print(col.toString());
              },
            );
          },
        ),
      ],
    );
  }
}
