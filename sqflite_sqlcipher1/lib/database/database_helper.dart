import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

class SqliteHelper {
  //#####student table
  static const String tableStudent = 'student';
  //student column
  static const String studentName = 'name';
  static const String studentRoll = 'roll';
  static const String studentIsMale = 'isMale';
  static const String studentResult = 'result';

  //-----------------------

  static late Database database;

  void createDatabase() async {
    Directory databaseDir =
        Directory('/storage/emulated/0/Download/sql_db_folder');

    await _createFolder(databaseDir);

    if (await databaseDir.exists()) {
      database = await openDatabase(
        '${databaseDir.path}/mydatabase.db',
        password: '1234',
        version: 3,
        onCreate: _createTableWithDatabase,
      );
    }
  }

  Future<void> _createFolder(Directory dir) async {
    if (!await Permission.storage.status.isGranted) {
      await Permission.storage.request();
    }
    if ((await dir.exists())) {
    } else {
      dir.create();
    }
  }

  void _createTableWithDatabase(db, version) async {
    String query =
        'CREATE TABLE $tableStudent ($studentName TEXT, $studentRoll INTEGER, $studentIsMale BOOL, $studentResult DOUBLE)';
    await db.execute(query);
  }

  void closeDatabase() {
    database.close();
  }
}
