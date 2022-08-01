import 'package:floor/floor.dart';
import 'package:flutter1august/entity/Employee.dart';

/// Created by Jai on 15,May,2020
@dao
abstract class EmployeeDao {
  @Query('SELECT * FROM Employee')
  Future<List<Employee>> findAllEmployee();

  @Query('Select * from Employee order by id desc limit 1')
  Future<Employee?> getMaxEmployee();

  @Query('SELECT * FROM Employee order by id desc')
  Stream<List<Employee>> fetchStreamData();

  @insert
  Future<void> insertEmployee(Employee employee);

  @insert
  Future<List<int>> insertAllEmployee(List<Employee> employee);

  @Query("delete from Employee where id = :id")
  Future<void> deleteEmployee(int id);

  @delete
  Future<int> deleteAll(List<Employee> list);
}
