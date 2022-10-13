import 'package:flutter/material.dart';

import 'package:login_with_signup/utils/routes_name.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: RouteName.LoginForm,
        image: new Image.asset(
          'assets/images/CVR.jpg',
          fit: BoxFit.cover,
        ),
        photoSize: 150.0,
        useLoader: true,
        loaderColor: Colors.green);
  }
}
