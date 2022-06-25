import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    //-----------switch to 'true' or 'flase'
    bool b1 = true;
    bool b2 = false;
    bool b3 = true;

    //if, else
    if (b1) {
      print('condition True');
    } else {
      print('condition False');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('If Else Ternary'),
        ),
        body: Column(
          children: [
            //ternary operator
            b2
                ? Text(
                    'HI',
                    style: TextStyle(color: Colors.green),
                  )
                : Text(
                    'BYE',
                    style: TextStyle(color: Colors.red),
                  ),
            //if else in widget
            if (b3)
              Text(
                'Positive',
                style: TextStyle(
                  fontSize: 22,
                ),
              )
            else
              Text(
                'Negative',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
