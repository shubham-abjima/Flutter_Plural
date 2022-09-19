import 'package:flutter/material.dart';
import 'package:flutter_architecture/utils/routes/routes_name.dart';

import 'package:flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userpreference = Provider.of<UserViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                InkWell(
                    child: Text("LogOut"),
                    onTap: () {
                      userpreference.remove().then((value) {
                        Navigator.pushNamed(context, RoutesName.login);
                      });
                    })
              ],
            ),
          ),
        ));
  }
}
