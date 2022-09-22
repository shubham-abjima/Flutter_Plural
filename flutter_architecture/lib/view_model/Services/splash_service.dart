import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_architecture/models/Usermodel.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';
import 'package:flutter_architecture/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      print(value.token.toString());
      if (value.token.toString() == 'null' || value.token.toString() == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.homepage);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
