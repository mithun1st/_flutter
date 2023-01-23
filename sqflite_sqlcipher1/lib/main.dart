import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:sqflite_sqlcipher1/database/database_helper.dart';
import 'package:sqflite_sqlcipher1/database/database_service.dart';
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
    Directory databaseDir =
        Directory('/storage/emulated/0/Download/sql_db_folder');

    if (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
    if ((await databaseDir.exists())) {
    } else {
      databaseDir.create();
      print('##FileCreate');
    }
    if (await databaseDir.exists()) {
      database = await openDatabase(
        '${databaseDir.path}/mydatabase.db',
        password: '1234',
        version: 3,
        onCreate: createTableDb,
      );
      print('##${database.path}');
    }
  }

  void createTableDb(db, version) async {
    print('##table');
    await db.execute(
        'CREATE TABLE $tableName (nameColumn TEXT, rollColumn INTEGER, isMaleColumn BOOL, resultColumn DOUBLE)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite SqlCiphper')),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                SqliteHelper().createDatabase();
              },
              child: Text('X-create')),
          ElevatedButton(
              onPressed: () {
                SqliteHelper().closeDatabase();
              },
              child: Text('X-close')),
          ElevatedButton(
              onPressed: () {
                SqliteService().addStudent(stuList[0]);
              },
              child: Text('X-add')),
          ElevatedButton(
              onPressed: () {
                SqliteService().getAllStudent();
              },
              child: Text('X-get')),
          ElevatedButton(
              onPressed: () {
                print(SqliteHelper.database.isOpen);
              },
              child: Text('X-isopen')),
          ElevatedButton(
              onPressed: () async {
                var v = await SqliteHelper.database.rawQuery(
                    'SELECT name FROM sqlite_master WHERE type=\'table\';');
                print('xxxxxxxxxxxxxtablist');
                print(v);
              },
              child: Text('X-tablist')),
          ElevatedButton(
              onPressed: () {
                initDatabase();
              },
              child: Text('init database')),
          ElevatedButton(
              onPressed: () {
                database.close();
              },
              child: Text('close database')),
          ElevatedButton(
              onPressed: () async {
                await database.execute(
                    'CREATE TABLE $tableName (nameColumn TEXT, rollColumn INTEGER, isMaleColumn BOOL, resultColumn DOUBLE)');
              },
              child: Text('create table')),
          ElevatedButton(
              onPressed: () async {
                await database.execute('DROP TABLE $tableName');
              },
              child: Text('drop table')),
          ElevatedButton(
              onPressed: () async {
                var v = await database.rawQuery(
                    'SELECT name FROM sqlite_master WHERE type=\'table\';');
                print(v);
              },
              child: Text('show tables')),
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
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(v.toString())));
                // print(v.runtimeType);
                // print(v);
              },
              child: Text('print')),
        ],
      ),
    );
  }
}
