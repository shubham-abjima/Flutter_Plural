// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 141, 141, 141),
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Color.fromARGB(255, 243, 98, 88),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // const DicePage({Key? key}) : super(key: key);
  int leftDiceNumber = 5;
  int rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    // leftDiceNumber = 3;
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              // child: Image(
              //   height: 400,
              onPressed: () {
                setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1;
                  rightDiceNumber = Random().nextInt(6) + 1;
                  // print('DiceNumber:  $leftDiceNumber');
                });
              },
              child: Image.asset('assets/images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            // flex: 1,

            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightDiceNumber = Random().nextInt(6) + 1;
                  leftDiceNumber = Random().nextInt(6) + 1;
                });
                // print("Right Button");
              },
              child: Image.asset('assets/images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
