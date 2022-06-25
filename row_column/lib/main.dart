import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Column / Row'),
        ),
        //column
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('column..........................................1'),
            const Text('column 2'),
            const Text('column 3'),
            const Text('column 4'),
            const Text('column 5'),

            //row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('row...................1'),
                Text('row 2'),
                Text('row 3'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
