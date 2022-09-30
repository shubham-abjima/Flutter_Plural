import 'package:firstapp/View/widgets/login_form.dart';
import 'package:firstapp/main.dart';
import 'package:firstapp/misc/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First App'), actions: [
        IconButton(
            icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              MyApp.themeNotifier.value =
                  MyApp.themeNotifier.value == ThemeMode.light
                      ? ThemeMode.dark
                      : ThemeMode.light;
            })
      ]),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text("First App", style: titleStyleIndigo),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: LoginForm(),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
