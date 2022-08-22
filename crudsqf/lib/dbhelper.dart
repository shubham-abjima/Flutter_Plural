import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databasename = "person.db";
  static final _databaseversion = 1;

  static final table = "my_table";

  static final columnId = "id";
  static final columnName = "Name";
  static final columnAge = "Age";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentdirectory = await getApplicationDocumentsDirectory();
    String path = join(documentdirectory.path, _databasename);

    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL,
      $columnAge INTEGER NOT NULL 
    )

  ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryallrows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<List<Map<String, dynamic>>> queryspecific(int age) async {
    Database? db = await instance.database;
    // var res = await db!.query(table, where: "age >= ?", whereArgs: [age]);
    var res = await db!.rawQuery("Select * From my_table where age = ?", [age]);
    return res;
  }

  Future<int> update(int id) async {
    Database? db = await instance.database;

    var res = await db!.update(table, {"name": "Alex", "age": 20},
        where: "id =?", whereArgs: [id]);
    return res;
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    var res = await db!.delete(table, where: 'id=?', whereArgs: [id]);
    return res;
  }
}
