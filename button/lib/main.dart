import 'package:button/radioButton1.dart';
import 'package:flutter/material.dart';
import 'package:button/ElevatedB.dart';
import 'package:button/OutlinedB.dart';
import 'package:button/TextB.dart';
import 'package:button/IconB.dart';
import 'package:button/ElevatedIconB1.dart';
import 'package:button/ElevatedIconB2.dart';
import 'package:button/CustomB1.dart';
import 'package:button/CustomB2.dart';
import 'package:button/switch1.dart';
import 'package:button/switchListTile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool sw = false;
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

            //switch
            SwitchA(),
            SwitchB(),

            //
            Radio1(),
            Text('hi'),
          ],
        ),

        //floating button
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text('HI'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
