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
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: DropdownButton(
                    alignment: Alignment.center,
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    isDense: true,
                    iconEnabledColor: Colors.green,
                    dropdownColor: Color.fromARGB(255, 225, 223, 223),
                    value: selectedValue,
                    items: [
                      DropdownMenuItem(
                        child: InkWell(
                          child: Text(
                            "Corp",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: InkWell(
                          child: Text("CVR-AK-Anchorage",
                              style: TextStyle(fontSize: 13)),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UploadImageScreen()));
                          },
                        ),
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Fairbanks",
                            style: TextStyle(fontSize: 13)),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Dothan",
                            style: TextStyle(fontSize: 13)),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Fairhope",
                            style: TextStyle(fontSize: 13)),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Hoover",
                            style: TextStyle(fontSize: 13)),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Mobile",
                            style: TextStyle(fontSize: 13)),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Mantgomery",
                            style: TextStyle(fontSize: 13)),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Opelika",
                            style: TextStyle(fontSize: 13)),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Trussville",
                            style: TextStyle(fontSize: 13)),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AZ-Gilbert",
                            style: TextStyle(fontSize: 13)),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child:
                            Text("CVR-AZ-Mesa", style: TextStyle(fontSize: 13)),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AZ-Phoenix",
                            style: TextStyle(fontSize: 13)),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-DC1-lrving Street",
                            style: TextStyle(fontSize: 13)),
                        value: 14,
                      ),
                      DropdownMenuItem(
                          child: Text("Others", style: TextStyle(fontSize: 13)),
                          value: 15),
                    ],
                    onChanged: (value) {
                      setState(() {
                        value = selectedValue;
                      });
                    }),
              ),
              Padding(padding: EdgeInsets.all(20)),
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
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Filter()),
                  ),
                )
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
