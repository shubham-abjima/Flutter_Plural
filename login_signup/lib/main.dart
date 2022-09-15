import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/Upload_file.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Screens/LoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login with Signup',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.grey,
      ),
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 6,
        navigateAfterSeconds: new MyHomePage(),
        image: new Image.asset(
          'assets/images/CVR.jpg',
          fit: BoxFit.cover,
        ),
        photoSize: 150.0,
        useLoader: true,
        loaderColor: Color.fromARGB(255, 1, 53, 96));
  }
}
