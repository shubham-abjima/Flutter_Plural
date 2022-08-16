import 'package:floordbapp/Loginscreen.dart';
import 'package:floordbapp/homepage.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginScreen(),
    );
  }
}





// import 'package:floordbapp/utils/routes.dart';
// import 'package:floordbapp/widgets/homepage.dart';
// import 'package:floordbapp/widgets/login.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(const AuthApp());

// class AuthApp extends StatelessWidget {
//   const AuthApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.grey),
//       initialRoute: '/',
//       routes: {
//         MyRoutes.homeScreen: (context) => MyHomePage(),
//         MyRoutes.loginScreen: (context) => LoginPage(),
//         // MyRoutes.signUp: (context) => SignUp(),
//         // MyRoutes.forgotPassword: (context) => ForgotPassword(),
//       },
//     );
//   }
// }
