import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  final String name = "Shubham";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 72, 71, 71),
        title: Center(
            child: Text(
          "Mobile Application",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(child: Container(child: Text("Welcome to Hompage $name !"))),
      drawer: Drawer(backgroundColor: Color.fromARGB(255, 72, 71, 71)),
    );
  }
}
