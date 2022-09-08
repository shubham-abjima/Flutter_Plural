import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/HomeForm.dart';
import 'package:login_with_signup/Screens/HomePage.dart';

class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'FILTER APPOINTMENT',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => MyHomePage()),
              (Route<dynamic> route) => false),
        ),
      ),
    );
  }
}
