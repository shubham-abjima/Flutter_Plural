import 'package:flutter/cupertino.dart';
import 'package:provider_app/Model/model.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MoviesDatabase {
  static final MoviesDatabase instance = MoviesDatabase._init();
  static Database? _database;
  MoviesDatabase._init();

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initializeDB("Movies.db");
    }
    return _database;
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final intType = "INTEGER NOT NULL";
    final textType = "TEXT NOT NULL";
    final boolType = "BOOLEAN NOT NULL";

    await db.execute('''
CREATE TABLE ${MoviesModel.Moviesforall1}(
  ${MoviesModel.IDName} $idType,
  ${MoviesModel.MovieName} $textType,
  ${MoviesModel.ImageName} $textType,
  ${MoviesModel.MovieKey_all} $intType,
  ${MoviesModel.SecondsOrNot} $boolType,
  ${MoviesModel.SecondsOrTimes} $textType)''');
//     await db.execute('''
// CREATE TABLE ${MoviesModel.Moviesforall2}(
//   ${MoviesModel.IDName} $idType,
//   ${MoviesModel.MovieName} $textType,
//   ${MoviesModel.MovieKey_all} $intType,
//   ${MoviesModel.ImageName} $textType,
//   ${MoviesModel.SecondsOrNot} $boolType,
//   ${MoviesModel.SecondsOrTimes} $textType)''');
//     await db.execute('''
// CREATE TABLE ${MoviesModel.Moviesforall3}(
//   ${MoviesModel.IDName} $idType,
//   ${MoviesModel.MovieName} $textType,
//   ${MoviesModel.ImageName} $textType,
//   ${MoviesModel.MovieKey_all} $intType,
//   ${MoviesModel.SecondsOrNot} $boolType,
//   ${MoviesModel.SecondsOrTimes} $textType)''');
    await db.execute('''
CREATE TABLE ${MoviesModel.AllMovies}(
  ${MoviesModel.IDName} $idType,
  ${MoviesModel.MovieKey_all} $intType,
  ${MoviesModel.MovieKey} $intType,
  ${MoviesModel.AllName} $textType,
  ${MoviesModel.BackImg} $textType,
  ${MoviesModel.TimeTaken} $textType,
  ${MoviesModel.TotalNoOfMovies} $textType)''');
    // ID, BOOL(SECONDS),TEXT
  }

  Future<Movie?> Insert(Movie movie, String TableName) async {
    final db = await instance.database;
    final id = await db!.insert(TableName, movie.toJson());
    return movie.copy(id: id);
  }

  Future<AllMovies?> InsertMovieSum(AllMovies allMovies) async {
    final db = await instance.database;
    final id = await db!.insert(MoviesModel.AllMovies, allMovies.toJson());
    return allMovies.copy(id: id);
  }

  Future<List<AllMovies>> readAllMovie(String TableName) async {
    final db = await instance.database;
    final orderBy = "${MoviesModel.IDName} ASC ";
    final query_res = await db!.query(TableName, orderBy: orderBy);
    return query_res.map((json) => AllMovies.fromJson(json)).toList();
  }

  Future<List<AllMovies>> readAllMovieSum() async {
    final db = await instance.database;
    final orderBy = "${MoviesModel.IDName} ASC ";
    final query_res = await db!.query(MoviesModel.AllMovies, orderBy: orderBy);
    return query_res.map((json) => AllMovies.fromJson(json)).toList();
  }

  Future<Movie?> readOneMovie(int id, String TableName) async {
    final db = await instance.database;

    final map = await db!.query(TableName,
        columns: MoviesModel.MovieModel1ColumnName,
        where: '${MoviesModel.IDName} =?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Movie.fromJson(map.first);
    } else {
      return null;
    }
  }
}
