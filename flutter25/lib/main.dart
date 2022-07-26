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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Row(
          //   children: <Widget>[Text("Hello , World")],
          // ),
          Expanded(
              child: Image.network(
                  'https://th.bing.com/th/id/OIP.Ol9CqdKpldXw0BLG5lfFzQHaFN?pid=ImgDet&rs=1'),
              flex: 3),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.deepPurple,
              child: Text('One'),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.blueGrey,
              child: Text('Two'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.pinkAccent,
              child: Text('Three'),
            ),
          )
        ],
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text('Hello World'),
        //     FlatButton(
        //       onPressed: () {},
        //       color: Colors.amber,
        //       child: Text('Click Me'),
        //     ),
        //     Container(
        //       color: Colors.cyan,
        //       padding: EdgeInsets.all(20),
        //       child: Text('Inside the container'),
        //     )
        //   ],

        // body: Padding(
        //   padding: EdgeInsets.all(90.0),
        //   // padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        //   // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        //   child: Text('Hello'),

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
