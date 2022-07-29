import 'package:flutter/material.dart';
import 'package:flutter29july/widgets/drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  final String name = "Shubham";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        // iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 72, 71, 71),
        title: Center(
            child: Text(
          "Mobile Application",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(child: Container(child: Text("Welcome to Hompage $name !"))),
      drawer: MyDrawer(),
    );
  }
}
