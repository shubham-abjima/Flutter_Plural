import 'package:floordbapp/homepage.dart';
import 'package:floordbapp/registrationscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

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
        RegExp regex = new RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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
          if (_formKey.currentState!.validate()) {
            print("Validated");
          } else {
            print("Not Validated");
          }
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
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

// import 'package:floordbapp/homepage.dart';

// import 'package:floordbapp/login.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   //StateFullWidget

//   @override
//   HomeScreenState createState() => HomeScreenState();
// }

// class HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       //Scaffold
//       body: SafeArea(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           color: Color.fromARGB(255, 73, 73, 73),
//           child: Stack(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.bottomRight,
//                 heightFactor: 0.5,
//                 widthFactor: 0.5,
//                 child: Material(
//                   borderRadius: const BorderRadius.all(Radius.circular(200.0)),
//                   color: const Color.fromRGBO(255, 255, 255, 0.4),
//                   child: Container(
//                     width: 400,
//                     height: 400,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   width: 400,
//                   height: 400,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       Material(
//                         elevation: 10.0,
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(10.0)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Image.network(
//                             "https://th.bing.com/th/id/R.e1ea54d724326c86319d0f40cd38a9b7?rik=VubThT7aHjv82A&riu=http%3a%2f%2fwww.advancedsec.com%2fwp-content%2fuploads%2f2018%2f11%2fprofile-blank.png&ehk=eD7UIM9IxPhlLvN0KKIol%2f3eiPECVcWPzDVVNuus5jg%3d&risl=&pid=ImgRaw&r=0",
//                             height: 100,
//                           ),
//                         ),
//                       ),
//                       // TextFormField(
//                       //   obscureText: true,
//                       //   decoration: InputDecoration(
//                       //     icon: Icon(
//                       //       Icons.email,
//                       //       color: Colors.white,
//                       //     ),
//                       //     hintText: "Enter Email",
//                       //     labelText: "Email",
//                       //   ),
//                       //   validator: (value) {
//                       //     if (value!.isEmpty) {
//                       //       return "Email cannot be empty";
//                       //     }
//                       //
//                       //     return null;
//                       //   },
//                       // ),
//                       Form(
//                         child: InputField(
//                           //Calling inputField  class

//                           const Icon(
//                             Icons.email,
//                             color: Colors.white,
//                           ),
//                           "Email",
//                         ),
//                       ),
//                       // TextFormField(
//                       //   obscureText: true,
//                       //   decoration: InputDecoration(
//                       //     icon: Icon(
//                       //       Icons.lock,
//                       //       color: Colors.white,
//                       //     ),
//                       //     hintText: "Enter password",
//                       //     labelText: "Password",
//                       //   ),
//                       //   validator: (value) {
//                       //     if (value!.isEmpty) {
//                       //       return "Password cannot be empty";
//                       //     } else if (value.length < 6) {
//                       //       return "Password length should be atleast 6";
//                       //     }
//                       //
//                       //     return null;
//                       //   },
//                       // ),
//                       Form(
//                         child: InputField(
//                             const Icon(
//                               Icons.lock,
//                               color: Colors.white,
//                             ),
//                             "Password"),
//                       ),
//                       Container(
//                         width: 120,
//                         height: 50,
//                         child: RaisedButton(
//                           //Raised Button
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => MyHomePage()));
//                           },
//                           color: Color.fromARGB(255, 57, 57, 58),
//                           textColor: Colors.white,
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                           shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
