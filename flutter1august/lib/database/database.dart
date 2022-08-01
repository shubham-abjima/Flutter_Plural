import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:floor/floor.dart';

import 'package:flutter1august/entity/Employee.dart';
import 'package:flutter1august/dao/EmployeeDAO.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Employee])
abstract class AppDatabase extends FloorDatabase {
  EmployeeDao get employeeDAO;
}
