import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:sqflite_sqlcipher1/model_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  List<StudentModel> stuList = [
    StudentModel(name: 'mahadi', roll: 35, isMale: true, result: 4.22),
    StudentModel(name: 'hassan', roll: 12, isMale: true, result: 3.52),
    StudentModel(name: 'mithun', roll: 17, isMale: true, result: 2.24),
    StudentModel(name: 'mr y', roll: 26, isMale: false, result: 3.48),
  ];

  late Database database;
  String tableName = 'studentTable';

  void initDatabase() async {
    database = await openDatabase('mydatabase.db', password: '12345');

    print(database.isOpen);
    print(database.path);
    print(await getDatabasesPath());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite SqlCiphper')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                initDatabase();
              },
              child: Text('init')),
          ElevatedButton(
              onPressed: () async {
                await database.execute(
                    'CREATE TABLE $tableName (nameColumn TEXT, rollColumn INTEGER, isMaleColumn BOOL, resultColumn DOUBLE)');
              },
              child: Text('create table')),
          ElevatedButton(
              onPressed: () async {
                await database.insert(tableName, {
                  'nameColumn': 'Mithun',
                  'rollColumn': 23,
                  'isMaleColumn': true,
                  'resultColumn': 3.62,
                });
              },
              child: Text('store data')),
          ElevatedButton(
              onPressed: () async {
                var v = await database.rawQuery('SELECT * FROM $tableName');
                print(v.runtimeType);
                print(v);
                // print(v.runtimeType);
                // print(v);
              },
              child: Text('print')),
          ElevatedButton(
              onPressed: () async {
                await database.execute('DROP TABLE $tableName');
              },
              child: Text('drop table')),
        ],
      ),
    );
  }
}
