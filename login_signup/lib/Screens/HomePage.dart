import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_with_signup/Screens/Filter.dart';

import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/Screens/Upload_file.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedValue = 1;
  String _chosenValue = "Corp";
  var selectedDate;

  var value;
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
              Icon(Icons.location_on, color: Colors.green),
              DropdownButton<String>(
                dropdownColor: Color.fromARGB(255, 216, 215, 215),
                alignment: Alignment.center,
                value: _chosenValue,

                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.green,
                ),
                //elevation: 5,
                style: TextStyle(color: Colors.black),

                items: <String>[
                  "Corp",
                  "CVR-AK-Anchorage",
                  "CVR-AK-Fairbanks",
                  "CVR-AL-Dothan",
                  "CVR-AL-Fairhope",
                  "CVR-AL-Hoover",
                  "CVR-AL-Mobile",
                  "CVR-AL-Mantgomery",
                  "CVR-AL-Opelika",
                  "CVR-AL-Trussville",
                  "CVR-AZ-Gilbert",
                  "CVR-AZ-Mesa",
                  "CVR-AZ-Phoenix",
                  "CVR-DC1-lrving Street",
                  "CVR-DC2-New Mexico Avenue",
                  "CVR-DC3-Providence",
                  "CVR-DE-Rehoboth",
                  "CVR-FL-Pembroke Pines",
                  "CVR-GA-Gwinnett",
                  "CVR-GA-Sandy Springs",
                  "CVR-GA-Camp Creek"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_chosenvalue) => UploadImageScreen()));
                    },
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),

                onChanged: (String value) {
                  setState(() {
                    UploadImageScreen();
                  });
                },
              ),
              SizedBox(
                width: 20,
              ),
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Calendar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                    textDirection: TextDirection.ltr,
                  ),
                ),
                SizedBox(
                  width: 175,
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.refresh_circled,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MyHomePage()),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_sharp,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Filter()),
                      (Route<dynamic> route) => false),
                ),
              ],
            ),
          ),
          Container(
            height: 75,
            width: MediaQuery.of(context).size.width,
            child: AnimatedHorizontalCalendar(
                tableCalenderButtonColor: Colors.red,
                tableCalenderIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                date: DateTime.now(),
                fontSizeOfMonth: 15,
                fontSizeOfWeek: 10,
                colorOfWeek: Colors.black,
                lastDate: DateTime.now().add(Duration(days: 365)),
                textColor: Colors.black45,
                backgroundColor: Colors.white,
                tableCalenderThemeData: ThemeData.light().copyWith(
                  primaryColor: Colors.red,
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  colorScheme: ColorScheme.light(primary: Colors.red)
                      .copyWith(secondary: Colors.red),
                ),
                selectedColor: Colors.redAccent,
                onDateSelected: (date) {
                  selectedDate = date;
                }),
          ),
          Text("No Records Found")
        ],
      ),
    );
  }
}
