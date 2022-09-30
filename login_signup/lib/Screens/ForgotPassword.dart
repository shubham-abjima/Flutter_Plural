import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/comHelper.dart';

import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/DatabaseHandler/DbHelper.dart';
import 'package:login_with_signup/Model/UserModel.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<ForgotPassword> {
  final _formKey = new GlobalKey<FormState>();
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  DbHelper dbHelper;
  final _conUserId = TextEditingController();
  final _conDelUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();

    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      _conUserId.text = sp.getString("user_id");
      _conDelUserId.text = sp.getString("user_id");
      _conUserName.text = sp.getString("user_name");
      _conEmail.text = sp.getString("email");
      _conPassword.text = sp.getString("password");
    });
  }

  update() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String passwd = _conPassword.text;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      UserModel user = UserModel(uid, uname, email, passwd);
      await dbHelper.updateUser(user).then((value) {
        if (value == 1) {
          alertDialog(context, "Successfully Updated");

          updateSP(user, true).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginForm()),
                (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error Update");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error");
      });
    }
  }

  delete() async {
    String delUserID = _conDelUserId.text;

    await dbHelper.deleteUser(delUserID).then((value) {
      if (value == 1) {
        alertDialog(context, "Successfully Deleted");

        updateSP(null, false).whenComplete(() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginForm()),
              (Route<dynamic> route) => false);
        });
      }
    });
  }

  Future updateSP(UserModel user, bool add) async {
    final SharedPreferences sp = await _pref;

    if (add) {
      sp.setString("user_name", user.user_name);
      sp.setString("email", user.email);
      sp.setString("password", user.password);
    } else {
      sp.remove('user_id');
      sp.remove('user_name');
      sp.remove('email');
      sp.remove('password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Center For Vein Restoration',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginForm()),
              (Route<dynamic> route) => false),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/333.png",
                  height: 200.0,
                  width: 200.0,
                ),
                Text(
                  "EasyPic",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                // genLoginSignupHeader("Forgot Password ?"),

                //Update
                // getTextFormField(
                //     controller: _conUserId,
                //     isEnable: true,
                //     icon: Icons.person,
                //     hintName: 'User ID'),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: _conUserName,
                  icon: Icons.person_outline,
                  inputType: TextInputType.name,
                  hintName: 'User Name',
                ),

                SizedBox(height: 10.0),
                getTextFormField(
                    controller: _conEmail,
                    icon: Icons.email,
                    inputType: TextInputType.emailAddress,
                    hintName: 'Email'),
                SizedBox(height: 10.0),

                getTextFormField(
                  controller: _conPassword,
                  icon: Icons.lock,
                  hintName: 'Password',
                  isObscureText: true,
                ),
                SizedBox(height: 10.0),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      'Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: update,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 79, 168, 85),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),

                //Delete

                // getTextFormField(
                //     controller: _conDelUserId,
                //     isEnable: true,
                //     icon: Icons.person,
                //     hintName: 'User ID'),
                // SizedBox(height: 10.0),

                // Container(
                //   margin: EdgeInsets.all(30.0),
                //   width: double.infinity,
                //   child: FlatButton(
                //     child: Text(
                //       'Delete',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     onPressed: delete,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(30.0),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
