import 'package:flutter/material.dart';

class TF2 extends StatelessWidget {
  //Controller variable
  TextEditingController c1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Text Field 2',
              hintText: 'type here...',
              icon: Icon(Icons.abc),
              labelStyle: TextStyle(
                backgroundColor: Colors.red,
              ),
              hintStyle: TextStyle(
                backgroundColor: Colors.yellow,
              ),
            ),
            //controller
            controller: c1,

            keyboardType: TextInputType.number,
            onEditingComplete: () {
              print(c1.text);
            },
          ),
          //button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('B1- ${c1.text}');
                },
                child: const Text('submitted'),
              ),
              ElevatedButton(
                onPressed: () {
                  c1.text = '3.1416';
                },
                child: const Text('set'),
              ),
              ElevatedButton(
                onPressed: () {
                  c1.clear();
                },
                child: const Text('clear'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
