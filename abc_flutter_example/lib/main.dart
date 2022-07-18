import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool? b = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test 1'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title Name'),
                      Text('This is subtitle, of that title'),
                    ],
                  ),
                ),
                //--------

                Text('data'),
                Switch(
                  value: b!,
                  onChanged: (b1) {
                    setState(() {
                      b = b1;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
