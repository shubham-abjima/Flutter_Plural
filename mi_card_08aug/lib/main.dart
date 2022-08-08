import 'package:flutter/material.dart';
import 'package:mi_card_08aug/widgets/drawer.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Mi Card App",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 35, 35, 35),
        ),
        backgroundColor: Color.fromARGB(255, 106, 104, 104),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                ),
              ),
              Text(
                "Shubham Khandelwal",
                style: TextStyle(
                    fontFamily: 'OleoScriptSwashCaps',
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 15,
                width: 200,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                // color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 96, 95, 95),
                  ),
                  title: Text(
                    "+91-1122334455",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),

              // Card(
              //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              //   color: Colors.white,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Row(children: [
              //       Icon(
              //         Icons.phone,
              //         color: Color.fromARGB(255, 96, 95, 95),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         "+91-1122334455",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.bold),
              //       )
              //     ]),
              //   ),
              // ),
              // Card(
              //   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              //   color: Colors.white,
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Row(children: [
              //       Icon(
              //         Icons.email,
              //         color: Color.fromARGB(255, 96, 95, 95),
              //       ),
              //       SizedBox(
              //         width: 10,
              //       ),
              //       Text(
              //         "Shubham.khandelwal@abjima.com",
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontStyle: FontStyle.normal,
              //             fontWeight: FontWeight.bold),
              //       )
              //     ]),
              //   ),
              // ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                // color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 96, 95, 95),
                  ),
                  title: Text(
                    "Shubham.khandelwal@abjima.com",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],

            //
          ),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
