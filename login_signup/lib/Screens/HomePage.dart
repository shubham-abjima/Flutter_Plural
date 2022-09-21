import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
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
              Icon(Icons.location_on, color: Color.fromARGB(255, 96, 8, 1)),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.white),
                child: DropdownButton(
                    alignment: Alignment.center,
                    isDense: true,
                    iconEnabledColor: Color.fromARGB(255, 96, 8, 1),
                    dropdownColor: Color.fromARGB(255, 225, 223, 223),
                    value: selectedValue,
                    items: [
                      DropdownMenuItem(
                        child: InkWell(
                          child: Text("Corp"),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: InkWell(
                          child: Text("CVR-AK-Anchorage"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UploadImageScreen()));
                          },
                        ),
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Fairbanks"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Dothan"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Fairhope"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Hoover"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Mobile"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Mantgomery"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Opelika"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AL-Trussville"),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AZ-Gilbert"),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AZ-Mesa"),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AZ-Phoenix"),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-DC1-lrving Street"),
                        value: 14,
                      ),
                      DropdownMenuItem(child: Text("Others"), value: 15),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    }),
              ),
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
