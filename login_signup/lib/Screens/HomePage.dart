import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/Filter.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/123.png",
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Icon(Icons.location_on, color: Color.fromARGB(255, 96, 8, 1)),
              DropdownButton(
                  value: selectedValue,
                  items: [
                    DropdownMenuItem(
                      child: Text("CVR-AK-Anchorage"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("CVR-AK-Fairbanks"),
                      value: 2,
                    ),
                    DropdownMenuItem(child: Text("Others"), value: 3),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
              Padding(padding: EdgeInsets.all(15)),
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.power_settings_new_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginForm()),
                        (Route<dynamic> route) => false),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "September 2022",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              padding: EdgeInsets.only(left: 215),
              icon: Icon(
                Icons.restore,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginForm()),
                  (Route<dynamic> route) => false),
            ),
            IconButton(
              icon: Icon(
                Icons.filter_list_alt,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => Filter()),
                  (Route<dynamic> route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
