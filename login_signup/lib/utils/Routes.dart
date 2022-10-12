import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/Appointment.dart';
import 'package:login_with_signup/Screens/Capture_images.dart';
import 'package:login_with_signup/Screens/Detail_Screen.dart';
import 'package:login_with_signup/Screens/Dropdown_button.dart';
import 'package:login_with_signup/Screens/Filter.dart';
import 'package:login_with_signup/Screens/ForgotPassword.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import 'package:login_with_signup/Screens/Splash_screen.dart';
import 'package:login_with_signup/utils/routes_name.dart';

class Routes {}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.HomePage:
      return MaterialPageRoute(builder: (context) => MyHomePage());
    case RouteName.Capture_images:
      return MaterialPageRoute(builder: (context) => captureImages());
    case RouteName.Detail_Screen:
      return MaterialPageRoute(builder: (context) => DetailScreen());
    case RouteName.ForgotPassword:
      return MaterialPageRoute(builder: (context) => ForgotPassword());
    case RouteName.Filter:
      return MaterialPageRoute(builder: (context) => Filter());
    case RouteName.Dropdown_button:
      return MaterialPageRoute(builder: (context) => DropDown());
    case RouteName.SignupForm:
      return MaterialPageRoute(builder: (context) => SignupForm());
    case RouteName.Appointment:
      return MaterialPageRoute(builder: (context) => Appointment());
    case RouteName.LoginForm:
      return MaterialPageRoute(builder: (context) => LoginForm());
    case RouteName.Splash_screen:
      return MaterialPageRoute(builder: (context) => Splash());
    default:
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: Center(child: Text("No Routes Defined")),
        );
      });
  }
}
