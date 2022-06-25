import 'package:flutter/material.dart';
import 'package:button/ElevatedB.dart';
import 'package:button/OutlinedB.dart';
import 'package:button/TextB.dart';
import 'package:button/IconB.dart';
import 'package:button/ElevatedIconB1.dart';
import 'package:button/ElevatedIconB2.dart';
import 'package:button/CustomB1.dart';
import 'package:button/CustomB2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Button'),
        ),
        body: Column(
          children: [
            //buttons
            ElevatedB(),
            TextB(),
            OutlinedB(),
            IconB(),
            ElevatedIconB1(),
            ElevatedIconB2(),

            //custom
            CustomButton1(),
            CustomButton2(),
            
          ],
        ),

        //floating button
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text('HI'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
