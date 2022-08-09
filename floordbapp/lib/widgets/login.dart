import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:floordbapp/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 150,
                child: Image.network(
                  'https://th.bing.com/th/id/OIP.r7iVFpSrV7zENPLKi-ms2gHaHa?pid=ImgDet&rs=1',
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Welcome To App',
                    textStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w500,
                    ),
                    speed: const Duration(
                      milliseconds: 450,
                    ),
                  ),
                ],
                onTap: () {
                  debugPrint("Welcome back!");
                },
                isRepeatingAnimation: true,
                totalRepeatCount: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Username/Email',
                        labelText: 'Email or Username',
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.forgotPassword);
                    //   },
                    //   child: const Text(
                    //     'Forgot Password?',
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton.icon(
                        onPressed: (() {
                          Navigator.pushNamed(context, MyRoutes.homeScreen);
                        }),
                        icon: const Icon(Icons.login),
                        label: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 83, 82, 82),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     const Text('Don\'t have an account?'),
                    //     TextButton(
                    //       onPressed: (() {
                    //         Navigator.pushNamed(
                    //           context,
                    //           MyRoutes.signUp,
                    //         );
                    //       }),
                    //       child: const Text(
                    //         'Sign Up',
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
