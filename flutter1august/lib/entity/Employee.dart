import 'package:floor/floor.dart';

/// Created by Jai on 15,May,2020
@entity
class Employee {
  @PrimaryKey(autoGenerate: true)
  final int id;
  String firstName, lastName, email;

  Employee(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});
}
