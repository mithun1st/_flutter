import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
    String folderName = 'sqldbfile';
    Directory dir = Directory("/storage/emulated/0/Download/$folderName");

    if (!await dir.exists()) {
      print('create##############');
      await dir.create();
    }
    print(dir.path);

    database = await openDatabase('${dir.path}/mydb.db', password: '1234',version: 2);

    print(database.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite SqlCiphper')),
      body: SingleChildScrollView(
        child: Column(
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
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(v.toString())));
                  // print(v.runtimeType);
                  // print(v);
                },
                child: Text('print')),
            ElevatedButton(
                onPressed: () async {
                  await database.execute('DROP TABLE $tableName');
                },
                child: Text('drop table')),
            ElevatedButton(
                onPressed: () async {
                  print(database.isOpen);
                  print(database.path);
                  print(await getDatabasesPath());
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(await getDatabasesPath())));
                },
                child: Text('Check')),
            // ElevatedButton(
            //     onPressed: () async {
                  
            //       print('---------------');
            //     },
            //     child: Text('create')),
          ],
        ),
      ),
    );
  }
}
