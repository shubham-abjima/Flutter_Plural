import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqllite_notes/Notes.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == Null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentDirectory.path, "database.db");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE  Database (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT NOT NULL,age INTEGER NOT NULL,description TEXT NOT NULL,email TEXT");
  }

  Future<Type> insert(DatabaseModel databaseModel) async {
    var dbClient = await db;
    await dbClient!.insert("database", databaseModel.toMap());
    return DatabaseModel;
  }

  Future<List<DatabaseModel>> getNotesList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query("database");
    return queryResult.map((e) => DatabaseModel.fromMap(e)).toList();
  }

  Future<int> delete(id) async {
    var dbClient = await db;
    return await dbClient!.delete("database", where: 'id= ?', whereArgs: [id]);
  }

  Future<int> update(DatabaseModel databaseModel) async {
    var dbClient = await db;
    return await dbClient!.update("database", databaseModel.toMap(),
        where: 'id= ?', whereArgs: [databaseModel.id]);
  }
}
