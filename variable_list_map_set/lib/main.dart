import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //dynamic variable
  dynamic dy;
  void dyFnc() {
    dy = 1;
    print(dy.runtimeType.toString());
    dy = 3.14;
    print(dy.runtimeType.toString());
    dy = 'Mh';
    print(dy.runtimeType.toString());
    dy = true;
    print(dy.runtimeType.toString());
    dy = ['a', 'b', 'c'];
    print(dy.runtimeType.toString());
  }

  //variable
  int i = 12;
  double d = 16;
  String s = 'Mahadi Hassan';
  bool b1 = true;
  bool b2 = false;
  DateTime? dt;

  //array variable
  List list1 = ['one', 'two', 'three'];
  List list2 = ['Mithun', 3.14, true, false];
  Map map1 = {'a': 'apple', 'b': 'ball', 'c': 'cat'};
  Set set1 = {'aa', 'bb', 'aa'}; //can't assign multiple value

  @override
  Widget build(BuildContext context) {
    //test dynamic variable
    dyFnc();
    dt = DateTime.now();
    print(dt);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Variable List Map Set'),
        ),
        body: Column(
          children: [
            Text(i.runtimeType.toString()),
            Text('Name- ${s.toUpperCase()}'),
            list2[2] ? const Text('hi') : const Text('bye'),
          ],
        ),
      ),
    );
  }
}
