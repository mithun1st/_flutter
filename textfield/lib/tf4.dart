import 'package:flutter/material.dart';

class TF4 extends StatefulWidget {
  @override
  State createState() {
    return TF4state();
  }
}

class TF4state extends State {
  bool isVisible = true;
  Icon i = const Icon(Icons.password);

  void isVis() {
    isVisible
        ? i = const Icon(Icons.visibility_off)
        : i = const Icon(Icons.visibility);
    isVisible = !isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'type here...',
          //icon button
          suffix: IconButton(
            icon: i,
            onPressed: () {
              isVis();
              setState(() {});
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: isVisible,
        maxLength: 8,
        onTap: () {
          i = const Icon(Icons.visibility);
          setState(() {});
        },
      ),
    );
  }
}
