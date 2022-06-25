import 'package:flutter/material.dart';

class TF1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Text Field 1',
          hintText: 'type here . . .',
          suffixIcon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        //button
        onChanged: (s) {
          print(s);
        },
        onEditingComplete: () {
          print('submitted done!');
        },
        onSubmitted: (s) {
          print('return text: $s');
        },
      ),
    );
  }
}
