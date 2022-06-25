import 'package:custom_widgets/cw2.dart';
import 'package:flutter/material.dart';

class CWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 12,
      color: Colors.blue.shade100,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.green.shade900,
      //     width: 3.2,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //1st part
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
            ),
            child: Text(
              'avater',
              style: TextStyle(fontSize: 28),
            ),
          ),

          //2nd part
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'title 1',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'title 2',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
