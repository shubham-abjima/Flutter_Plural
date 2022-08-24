import 'package:flutter/material.dart';
import 'package:sqfliteflutter/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite App',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}
