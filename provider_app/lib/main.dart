import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider_app/Widgets/Drawer.dart';
import 'package:provider_app/screens/Break.dart';
import 'package:provider_app/screens/Complete.dart';
import 'package:provider_app/screens/Moviesdet.dart';
import 'package:provider_app/screens/MyHomepage.dart';
import 'package:provider_app/screens/Splash_Screen.dart';
import 'package:provider_app/screens/StartUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.acmeTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
