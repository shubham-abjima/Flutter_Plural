import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Demo App",

          ),

        ),
      ),
          body: Image(image: AssetImage("assets/images/login_image.png"),
          // body: Center(child: Image( image: NetworkImage('https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg?auto=compress&cs=tinysrgb&w=1600',),)),
    )),
  );
}
