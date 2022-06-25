import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    //-------------null
    /* 
    String s1 = 'Hi';
      if (s1 != null) {
        print(s1);
      }
    */

    String? str = 'Hello World'; //sw1
    //String? str;      //sw2
    print(str);

    //-------(?.)
    // String? ss='Mithun';  //sw1
    String? ss; //sw2
    ss = ss?.toUpperCase();
    print(ss);

    //----- (??)
    String? s; //sw1
    //String? s='hi'; //sw2
    s = s ?? 'bye';
    print(s);

    //--------- (??=)
    // int? i=7;  //sw1
    int? i; //sw2
    i ??= 10;
    print(i);

    //----------(late)
    String s1;
    s1 = 'its a promise to initial later';
    print(s1);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Null Safety'),
        ),
        body: const Center(
          child: Text('NULL Operation(.? \t ?? \t ??=)'),
        ),
      ),
    );
  }
}
