import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello World Application",
      home: Scaffold(
          appBar: AppBar(
            title: Text('App bar Title'),
          ),
          body: Center(
            child: HelloText(),
          )),
    );
  }
}

class HelloText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HelloState();
  }
}

class HelloState extends State<HelloText> {
  String helloText = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (text) => sayHello(text),
          controller: myController,
        ),
        Text(helloText)
      ],
    );
  }

  void sayHello(String text) {
    setState(() {
      helloText = 'Hello' + text.toUpperCase() + '!';
    });
  }

  final myController = TextEditingController();
}
