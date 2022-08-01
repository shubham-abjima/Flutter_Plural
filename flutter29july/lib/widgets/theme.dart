import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 72, 71, 71)),
        // primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: Theme.of(context).textTheme,
        // primaryTextTheme: GoogleFonts.latoTextTheme( )
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      // brightness: Brightness.dark,
      );

  // primaryTextTheme: GoogleFonts.latoTextTheme( )
}
// 