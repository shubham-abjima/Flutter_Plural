import 'package:faker/faker.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter1august/dao/EmployeeDAO.dart';
import 'package:flutter1august/database/database.dart';
import 'package:flutter1august/entity/Employee.dart';
import 'package:sqflite/sql.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('edmt_database.db').build();
  final dao = database.employeeDAO;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final EmployeeDao dao;
  MyApp({required this.dao}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page', dao: dao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.dao})
      : super(key: key);
  final Employee dao;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () async {
                final employee = Employee(
                    id: hashCode,
                    firstName: Faker().person.firstName(),
                    lastName: Faker().person.lastName(),
                    email: Faker().internet.email());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
