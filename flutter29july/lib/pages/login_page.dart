import 'package:flutter/material.dart';
import 'package:flutter29july/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/Images/Login.png",
              fit: BoxFit.cover,
              // height: 200,
              //
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username Cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Cannot be empty";
                      } else if (value.length < 8) {
                        return "Password length should be atleast 8 ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Material(
                    color: Color.fromARGB(255, 72, 71, 71),
                    borderRadius: BorderRadius.circular(changeButton ? 60 : 8),
                    child: InkWell(
                      // splashColor: Colors.deepPurple,
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        height: 40,
                        width: changeButton ? 60 : 120,
                        // color: Colors.grey,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.thumb_up_sharp,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                        // decoration: BoxDecoration(
                        //     color: Color.fromARGB(255, 72, 71, 71),
                        //     // shape:
                        //     //     changeButton ? BoxShape.circle : BoxShape.rectangle,
                        //     ),
                        duration: Duration(seconds: 1),
                        // duration: Duration(seconds: 2),
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //     child: Text(
                  //       "Login",
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     })
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
