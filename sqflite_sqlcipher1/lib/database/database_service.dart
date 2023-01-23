import 'package:sqflite_sqlcipher1/database/database_helper.dart';
import 'package:sqflite_sqlcipher1/model_class.dart';

class SqliteService {
  addStudent(StudentModel studentModel) async {
    // String query =
    //     'INSERT INTO ${SqliteHelper.tableStudent} VALUE (\'xx\', 23, 1, 22.22 )';
    // var v = await SqliteHelper.database.rawInsert(query);
    // print(v);
    var v = await SqliteHelper.database
        .insert(SqliteHelper.tableStudent, studentModel.toJson());
    print(v);
  }

  getAllStudent() async {
    String query = 'SELECT * FROM ${SqliteHelper.tableStudent}';
    var v = await SqliteHelper.database.rawQuery(query);
    print(v);
  }
}
