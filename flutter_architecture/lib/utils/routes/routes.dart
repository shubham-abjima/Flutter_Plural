import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';
import 'package:flutter_architecture/view/Splash_screen.dart';
import 'package:flutter_architecture/view/home_screen.dart';
import 'package:flutter_architecture/view/login_view.dart';
import 'package:flutter_architecture/view/signup_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());
      case RoutesName.homepage:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginView());
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
              body: Center(
            child: Text("No Routes Defined"),
          ));
        });
    }
  }
}
