import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sqllite_notes/Db_handler.dart';
import 'package:sqllite_notes/Notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper? dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database SqfLite"),
        centerTitle: true,
      ),
      body: Column(children: []),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper
              ?.insert(DatabaseModel(
                  title: "First Database",
                  age: 22,
                  description: "This Is First Database",
                  email: "xyz@gmail.com"))
              .then((value) => print("Data Added"))
              .onError((error, stackTrace) => print(error.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
