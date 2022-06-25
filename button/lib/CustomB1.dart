import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Custom Button 1'),
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          width: 3,
          color: Colors.red,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
