import 'package:flutter/material.dart';
import 'package:constructor/constructor.dart';
import 'package:constructor/student_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //----------------------------------------Student model
    List<Student> grp = [
      Student(roll: 02, name: 'Moin', isMale: true),
      Student(roll: 01, name: 'Misty', isMale: false),
      Student(roll: 05, name: 'Mahadi', isMale: true),
    ];

    print(grp);
    print(grp[0]);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Constructor'),
        ),
        body: Column(
          children: [
            //----------------------Constructor
            Cls('configure 0'),
            Cls.newConstructor1('configure 1'),
            Cls.newConstructor2('configure 2'),
          ],
        ),
      ),
    );
  }
}
