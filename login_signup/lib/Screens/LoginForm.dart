import 'package:flutter/material.dart';

import 'package:login_with_signup/Comm/comHelper.dart';

import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:login_with_signup/Model/UserModel.dart';
import 'package:login_with_signup/Screens/ForgotPassword.dart';
import 'package:login_with_signup/Screens/HomePage.dart';
import 'package:login_with_signup/Screens/SignupForm.dart';
import 'package:login_with_signup/main.dart';
import 'package:login_with_signup/utils/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isChecked = false;

  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();

  var dbHelper;

  @override
  void initState() {
    super.initState();
    _loadUserEmailPassword();

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
            Navigator.pushNamedAndRemoveUntil(
                context, RouteName.HomePage, (Route<dynamic> route) => false);
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
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier?.value == ThemeMode.light
                  ? Icons.dark_mode_sharp
                  : Icons.light_mode_sharp),
              onPressed: () {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                print("Theme Changed");
              })
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyApp.themeNotifier.value == ThemeMode.dark
              ? Image.asset(
                  "assets/images/123.png",
                  color: Colors.white,
                )
              : Image.asset(
                  "assets/images/123.png",
                ),
        ),
        title: Text("Center For Vein Restoration"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blur.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              Image.asset(
                "assets/images/333.png",
                color: Colors.white,
                height: 200.0,
                width: 200.0,
              ),
              Text(
                "EasyPic",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 20.0),
              getTextFormField(
                controller: _conUserId,
                icon: Icons.person_outline,
                hintName: 'Username',
              ),
              SizedBox(height: 10.0),
              getTextFormField(
                controller: _conPassword,
                icon: Icons.key_sharp,
                hintName: 'Password',
                isObscureText: true,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(
                  left: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 24.0,
                        width: 30.0,
                        child: Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Colors.green // Your color
                              ),
                          child: Switch(
                              activeTrackColor: Colors.white,
                              activeColor: Colors.green,
                              value: _isChecked,
                              onChanged: _handleRememberme),
                        )),
                    SizedBox(width: 20.0),
                    Text("Remember Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 22),
                      width: 120,
                      height: 50,
                      child: FlatButton(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: login,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 79, 168, 85),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 10),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteName.ForgotPassword);
                            },
                            child: Text("Forgot Password ?",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't Have An Account ?",
                        style: TextStyle(
                          // fontSize: 15,

                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.SignupForm);
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRememberme(bool value) {
    _isChecked = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('UserName', _conUserId.text);
        prefs.setString('password', _conPassword.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _userName = _prefs.getString("UserName") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _rememberMe = _prefs.getBool("remember_me") ?? false;
      print(_rememberMe);
      print(_userName);
      print(_password);
      if (_rememberMe) {
        setState(() {
          _isChecked = true;
        });
        _conUserId.text = _userName ?? "";
        _conPassword.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
}
