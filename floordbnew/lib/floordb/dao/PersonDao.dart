import 'package:floor/floor.dart';

import '../entity/Person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Person?> findPersonById(int id);

  @Query('UPDATE * FROM Person WHERE id = :id')
  Future<Person?> updatePersonById(int id);

  @insert
  Future<void> insertPerson(Person person);

  @Query('DELETE FROM Person WHERE id=:id')
  Future<void> deleteById(int id);
}
