import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_with_signup/Screens/HomePage.dart';

import 'package:splashscreen/splashscreen.dart';

import 'Screens/LoginForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Login with Signup',
            theme: ThemeData(
              useMaterial3: true,
              textTheme:
                  GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.grey,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: Splash2(),
          );
        });
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new MyHomePage(),
        image: new Image.asset(
          'assets/images/CVR.jpg',
          fit: BoxFit.cover,
        ),
        photoSize: 150.0,
        useLoader: true,
        loaderColor: Colors.green);
  }
}
