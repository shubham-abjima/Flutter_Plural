import 'package:flutter/material.dart';
import 'package:flutter_architecture/utils/general_utils.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        InkWell(
            child: Text("Click Me"),
            onTap: () {
              Utils.toastMessage("No Internet Connection");
            })
      ],
    ));
  }
}
