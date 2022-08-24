import 'package:flutter/cupertino.dart';
import 'package:sqfliteflutter/Login/login_page.dart';
import 'package:sqfliteflutter/home_page.dart';

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/': (BuildContext context) => LoginPage(),
};
