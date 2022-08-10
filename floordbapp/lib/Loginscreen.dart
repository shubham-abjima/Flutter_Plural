import 'package:floordbapp/homepage.dart';

import 'package:floordbapp/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  //StateFullWidget

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //Scaffold
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 73, 73, 73),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(200.0)),
                  color: const Color.fromRGBO(255, 255, 255, 0.4),
                  child: Container(
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 400,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 10.0,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.network(
                            "https://th.bing.com/th/id/R.e1ea54d724326c86319d0f40cd38a9b7?rik=VubThT7aHjv82A&riu=http%3a%2f%2fwww.advancedsec.com%2fwp-content%2fuploads%2f2018%2f11%2fprofile-blank.png&ehk=eD7UIM9IxPhlLvN0KKIol%2f3eiPECVcWPzDVVNuus5jg%3d&risl=&pid=ImgRaw&r=0",
                            height: 100,
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     icon: Icon(
                      //       Icons.email,
                      //       color: Colors.white,
                      //     ),
                      //     hintText: "Enter Email",
                      //     labelText: "Email",
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Email cannot be empty";
                      //     }
                      //
                      //     return null;
                      //   },
                      // ),
                      Form(
                        child: InputField(
                          //Calling inputField  class

                          const Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          "Email",
                        ),
                      ),
                      // TextFormField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     icon: Icon(
                      //       Icons.lock,
                      //       color: Colors.white,
                      //     ),
                      //     hintText: "Enter password",
                      //     labelText: "Password",
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "Password cannot be empty";
                      //     } else if (value.length < 6) {
                      //       return "Password length should be atleast 6";
                      //     }
                      //
                      //     return null;
                      //   },
                      // ),
                      Form(
                        child: InputField(
                            const Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            "Password"),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        child: RaisedButton(
                          //Raised Button
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                          },
                          color: Color.fromARGB(255, 57, 57, 58),
                          textColor: Colors.white,
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
