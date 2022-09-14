import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/Filter.dart';
import 'package:login_with_signup/Screens/HomeForm.dart';
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
                    isDense: true,
                    iconEnabledColor: Color.fromARGB(255, 96, 8, 1),
                    dropdownColor: Color.fromARGB(255, 225, 223, 223),
                    value: selectedValue,
                    items: [
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        onTap: () {
                          UploadImageScreen();
                        },
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Fairbanks"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 5,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 6,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 7,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 8,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 9,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 11,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 13,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 14,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text("CVR-AK-Anchorage"),
                        value: 16,
                      ),
                      DropdownMenuItem(child: Text("Others"), value: 17),
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
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Calendar",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => MyHomePage()),
                        (Route<dynamic> route) => false),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.filter_list_alt,
                      color: Colors.black,
                      size: 25,
                    ),
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Filter()),
                        (Route<dynamic> route) => false),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 82,
            child: AnimatedHorizontalCalendar(
                tableCalenderButtonColor: Colors.redAccent,
                tableCalenderIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                date: DateTime.now(),
                textColor: Colors.black45,
                backgroundColor: Colors.white,
                tableCalenderThemeData: ThemeData.light().copyWith(
                  primaryColor: Colors.green,
                  buttonTheme:
                      ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  colorScheme: ColorScheme.light(primary: Colors.redAccent)
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
