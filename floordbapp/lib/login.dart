import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  Icon fieldIcon;
  String hintText;

  InputField(this.fieldIcon, this.hintText, {Key? key}) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _text = TextEditingController();
  final bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Color.fromARGB(255, 57, 57, 58),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.fieldIcon,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              width: 200,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: TextFormField(
                    //TestField
                    controller: _text,

                    decoration: InputDecoration(
                      errorText: _validate ? "Email" : null,
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:floordbapp/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String name = "";
//   bool changeButton = false;

//   final _formKey =
// GlobalKey<FormState>();

//   moveToHome(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         changeButton = true;
//       });
//       await Future.delayed(Duration(seconds: 1));
//       // await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
//       (VxState.store)
//           .navigator
//           .routeManager
//           .push(Uri.parse(MyRoutes.homeScreen));

//       setState(() {
//         changeButton = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: context.canvasColor,
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 100,
//                   child: Image.network(
//                     "https://th.bing.com/th/id/OIP.r7iVFpSrV7zENPLKi-ms2gHaHa?pid=ImgDet&rs=1",
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   "Welcome $name",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 16.0, horizontal: 32.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         decoration: InputDecoration(
//                           icon: Icon(Icons.email),
//                           hintText: "Enter Email",
//                           labelText: "Email",
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Username cannot be empty";
//                           }

//                           return null;
//                         },
//                         onChanged: (value) {
//                           name = value;
//                           setState(() {});
//                         },
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           icon: Icon(Icons.lock),
//                           hintText: "Enter password",
//                           labelText: "Password",
//                         ),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Password cannot be empty";
//                           } else if (value.length < 6) {
//                             return "Password length should be atleast 6";
//                           }

//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 40.0,
//                       ),
//                       Material(
//                         color: Colors.grey,
//                         borderRadius:
//                             BorderRadius.circular(changeButton ? 50 : 8),
//                         child: InkWell(
//                           onTap: () => moveToHome(context),
//                           child: AnimatedContainer(
//                             duration: Duration(seconds: 1),
//                             width: changeButton ? 50 : 150,
//                             height: 40,
//                             alignment: Alignment.center,
//                             child: changeButton
//                                 ? Icon(Icons.done, color: Colors.white)
//                                 : Center(
//                                     child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20,
//                                       ),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

                      // SizedBox(
                      //   height: 20.0,
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     context.vxNav.push(Uri.parse(MyRoutes.signupRoute));
                      //   },
                      //   style: ButtonStyle(
                      //     foregroundColor: MaterialStateProperty.all(
                      //       context.accentColor,
                      //     ),
                      //   ),
                      //   child: Text("Sign Up").text.headline6(context).make(),
                      // ),
                      // Link(
                      //     // uri: Uri.parse("https://codepur.dev"),
                      //     uri: Uri.parse(MyRoutes.cartRoute),
                      //     target: LinkTarget.blank,
                      //     builder: (context, followLink) {
                      //       return TextButton(
                      //           onPressed: followLink,
                      //           style: ButtonStyle(
                      //               foregroundColor: MaterialStateProperty.all(
                      //                   context.accentColor)),
                      //           child: Text("Go to codepur"));
                      //     }),
                      // SizedBox(
                      //   height: 20.0,
                      // ),


// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:floordbapp/utils/routes.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               CircleAvatar(
//                 radius: 150,
//                 child: Image.network(
//                   'https://th.bing.com/th/id/OIP.r7iVFpSrV7zENPLKi-ms2gHaHa?pid=ImgDet&rs=1',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               AnimatedTextKit(
//                 animatedTexts: [
//                   TypewriterAnimatedText(
//                     'Welcome To App',
//                     textStyle: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 30,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Times New Roman',
//                       fontWeight: FontWeight.w500,
//                     ),
//                     speed: const Duration(
//                       milliseconds: 450,
//                     ),
//                   ),
//                 ],
//                 onTap: () {
//                   debugPrint("Welcome back!");
//                 },
//                 isRepeatingAnimation: true,
//                 totalRepeatCount: 2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 16,
//                   horizontal: 32,
//                 ),
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.email),
//                         hintText: 'Enter Your Username/Email',
//                         labelText: 'Email or Username',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Username cannot be empty";
//                         }

//                         return null;
//                       },
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.lock),
//                         hintText: 'Enter Your Password',
//                         labelText: 'Password',
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Password cannot be empty";
//                         } else if (value.length < 6) {
//                           return "Password length should be atleast 6";
//                         }

//                         return null;
//                       },
//                       onChanged: (value) {
//                         setState(() {});
//                       },
//                     ),
//                     // TextButton(
//                     //   onPressed: () {
//                     //     Navigator.pushNamed(context, MyRoutes.forgotPassword);
//                     //   },
//                     //   child: const Text(
//                     //     'Forgot Password?',
//                     //   ),
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: TextButton.icon(
//                         onPressed: (() {
//                           Navigator.pushNamed(context, MyRoutes.homeScreen);
//                         }),
//                         icon: const Icon(Icons.login),
//                         label: Container(
//                           alignment: Alignment.center,
//                           width: 150,
//                           height: 35,
//                           child: const Text(
//                             'Sign In',
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 83, 82, 82),
//                             borderRadius: BorderRadius.circular(25),
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Row(
//                     //   children: [
//                     //     const Text('Don\'t have an account?'),
//                     //     TextButton(
//                     //       onPressed: (() {
//                     //         Navigator.pushNamed(
//                     //           context,
//                     //           MyRoutes.signUp,
//                     //         );
//                     //       }),
//                     //       child: const Text(
//                     //         'Sign Up',
//                     //         style: TextStyle(
//                     //           fontSize: 15,
//                     //           fontWeight: FontWeight.bold,
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ],
//                     //   mainAxisAlignment: MainAxisAlignment.center,
//                     // ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
