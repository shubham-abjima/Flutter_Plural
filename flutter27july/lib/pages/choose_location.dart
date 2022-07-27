import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 147, 180),
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 1,
      ),
      // ignore: deprecated_member_use
      body: RaisedButton(
        color: Colors.grey,
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Text(
          'Counter is $counter',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
