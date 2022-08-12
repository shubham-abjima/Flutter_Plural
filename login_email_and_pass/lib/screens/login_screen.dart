import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_email_and_pass/screens/home_screen.dart';
import 'package:login_email_and_pass/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter  Your Email";
        }
        if (RegExp(
                r"^ [a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_` {|}~]+@[a-zA-Z0-9]+. [a-zA-Z]+")
            .hasMatch(value)) {
          return "Please Enter A Valid Email Address";
        }
        return null;
        //Reg Expresion for email validation
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.all(20),
        hintText: "Email",
        labelText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // password field

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      // keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp();
        if (value!.isEmpty) {
          return "Please Enter Your Password";
        }
        if (!regex.hasMatch(value)) {
          return "Please Enter Valid Password ";
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.all(20),
        hintText: "Password",
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        minWidth: 150,
        height: 20,
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Mobile App"),
        ),
        backgroundColor: Color.fromARGB(255, 73, 73, 73),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://wallpapercave.com/wp/q9hLSeh.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(100.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 150,
                        child: Image.network(
                          'https://seeklogo.com/images/F/Ford_Motor_Company-logo-CCFFCF5685-seeklogo.com.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    emailField,
                    SizedBox(
                      height: 10,
                    ),
                    passwordField,
                    SizedBox(
                      height: 10,
                    ),
                    loginButton,
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't Have An Account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
