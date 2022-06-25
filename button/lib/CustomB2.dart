import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Custom Button 2'),
      //------
      style: ElevatedButton.styleFrom(
        //size
        minimumSize: const Size(300, 80),
        //border
        side: const BorderSide(
          width: 3,
          color: Colors.red,
        ),
        //shape
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
