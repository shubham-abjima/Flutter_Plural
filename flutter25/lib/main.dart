import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Application!'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        color: Colors.grey, child: Text('Hello'),

        // body: Center(
        //     child: RaisedButton.icon(
        //   onPressed: () {},
        //   icon: Icon(Icons.mail),
        //   label: Text('Click Me'),
        //   color: Colors.grey,
        // )

        // child: Image.network(
        //     ('https://images.pexels.com/photos/461940/pexels-photo-461940.jpeg')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('✔'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
