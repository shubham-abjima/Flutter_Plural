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

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image(
            image: AssetImage('assets/images/dice1.png'),
          ),
        ),
        Expanded(
          // flex: 1,
          child: Image(
            image: AssetImage('assets/images/dice2.png'),
          ),
        )
      ],
    );
  }
}
