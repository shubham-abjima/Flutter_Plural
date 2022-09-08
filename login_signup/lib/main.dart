import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        textTheme: GoogleFonts.arvoTextTheme(Theme.of(context).textTheme),
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
        navigateAfterSeconds: new LoginForm(),
        // title: new Text(
        //   'GeeksForGeeks',
        //   textScaleFactor: 2,
        // ),
        image: new Image.asset(
          'assets/images/CVR.jpg',
          fit: BoxFit.cover,
        ),
        // loadingText: Text("Loading"),
        photoSize: 150.0,
        useLoader: true,
        loaderColor: Color.fromARGB(255, 1, 53, 96));
  }
}
