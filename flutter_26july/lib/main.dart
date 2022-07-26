import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: NinjaCard(),
    ));

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 75, 74, 74),
      appBar: AppBar(
        title: Text(
          'Project ID Card',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/weather.jpg'),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 60,
                  color: Colors.grey[800],
                ),
                Text(
                  'NAME',
                  style: TextStyle(
                      color: Color.fromARGB(255, 167, 165, 165),
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Peter PatinSon',
                  style: TextStyle(
                      color: Color.fromARGB(255, 10, 10, 10),
                      letterSpacing: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'CURRENT PROJECT LEVEL',
                  style: TextStyle(
                    color: Color.fromARGB(255, 158, 156, 156),
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$ninjaLevel',
                  style: TextStyle(
                      color: Color.fromARGB(255, 8, 8, 8),
                      letterSpacing: 2,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'alexwage@gmail.com',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18,
                          letterSpacing: 1),
                    )
                  ],
                )
              ])),
    );
  }
}
