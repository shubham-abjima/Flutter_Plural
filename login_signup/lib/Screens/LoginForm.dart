import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/comHelper.dart';
import 'package:login_with_signup/Comm/genLoginSignupHeader.dart';
import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:login_with_signup/Model/UserModel.dart';
import 'package:login_with_signup/Screens/ForgotPassword.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeForm.dart';
import 'package:getwidget/getwidget.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeForm()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("password", user.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Center For Vein Restoration',
      //     style: TextStyle(color: Color.fromARGB(255, 1, 53, 96)),
      //   ),
      // ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/blur.jpg"),
              fit: BoxFit.none,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              Image.asset(
                "assets/images/333.png",
                height: 200.0,
                width: 200.0,
              ),
              TextButton(
                child: Text(
                  "EasyPic",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              SizedBox(height: 30.0),
              // genLoginSignupHeader("LogIn"),
              getTextFormField(
                  controller: _conUserId,
                  icon: Icons.person,
                  hintName: 'User ID'),
              SizedBox(height: 10.0),
              getTextFormField(
                controller: _conPassword,
                icon: Icons.key_sharp,
                hintName: 'Password',
                isObscureText: true,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GFToggle(
                      enabledTrackColor: Color.fromARGB(255, 1, 53, 96),
                      disabledTrackColor: Colors.grey,
                      enabledText: "✔",
                      disabledText: "✘",
                      type: GFToggleType.ios,
                      // boxShape: BoxShape.rectangle,
                      onChanged: (value) {
                        LoginForm();
                      },
                      borderRadius: BorderRadius.circular(50),
                      value: true,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 5,
                  left: 35,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 30),
                    width: 150,
                    height: 50,
                    child: FlatButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: login,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 53, 96),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ForgotPassword()));
                      },
                    )
                  ],
                ),
              ),
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('Does Not Have An Account ?',
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           )),
              //       FlatButton(
              //         textColor: Colors.white,
              //         child: Text(
              //           'Signup',
              //           style: TextStyle(
              //               fontSize: 15,
              //               fontWeight: FontWeight.bold,
              //               color: Color.fromARGB(255, 1, 53, 96)),
              //         ),
              //         onPressed: () {
              //           Navigator.push(context,
              //               MaterialPageRoute(builder: (_) => SignupForm()));
              //         },
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
