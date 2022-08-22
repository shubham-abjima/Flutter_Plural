import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:speechtotext/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
