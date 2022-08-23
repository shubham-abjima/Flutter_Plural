import 'dart:async';

import 'package:sqfliteflutter/network_utils.dart';
import 'package:sqfliteflutter/user.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) {
    return new Future.value(new User(username, password));
  }
}
