import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_with_signup/utils/Routes.dart';
import 'package:login_with_signup/utils/routes_name.dart';

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
              primarySwatch: Colors.grey,
              useMaterial3: true,
              // textTheme:
              //     GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            initialRoute: RouteName.Splash_screen,
            onGenerateRoute: Routes.generateRoute,
          );
        });
  }
}
