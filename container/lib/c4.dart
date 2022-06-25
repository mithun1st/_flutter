import 'package:flutter/material.dart';

class Container4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.purple,

        //shape
        shape: BoxShape.rectangle,

        //border
        border: Border.all(
          width: 5,
          color: Colors.lightBlue,
        ),

        //radius
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(20),
        ),
        
      ),
    );
  }
}
