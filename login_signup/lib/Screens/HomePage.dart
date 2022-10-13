import 'package:animated_horizontal_calendar/animated_horizontal_calendar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/Dropdown_button.dart';

import 'package:login_with_signup/Screens/Filter.dart';

import 'package:login_with_signup/Screens/LoginForm.dart';

import 'package:login_with_signup/main.dart';
import 'package:login_with_signup/utils/routes_name.dart';

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
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(), child: DropDown()),
                ),
              ],
            ),
            leading: IconButton(
              icon: MyApp.themeNotifier.value == ThemeMode.dark
                  ? Image.asset(
                      "assets/images/123.png",
                      color: Colors.white,
                    )
                  : Image.asset(
                      "assets/images/123.png",
                    ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.power_settings_new_rounded,
                  ),
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context,
                      RouteName.LoginForm, (Route<dynamic> route) => false),
                ),
              )
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Calendar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              CupertinoIcons.refresh_circled,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.HomePage);
                            }),
                        Filter == 1
                            ? MaterialButton(
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                disabledColor: Colors.red,
                                height: 25,
                                minWidth: 10,
                                child: Text("Clear"),
                              )
                            : MaterialButton(
                                color: Colors.orange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                                height: 25,
                                minWidth: 10,
                                child: Text("Clear"),
                              ),
                        IconButton(
                            icon: Icon(
                              Icons.filter_alt_sharp,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.Filter);
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 75,
              width: MediaQuery.of(context).size.width,
              child: AnimatedHorizontalCalendar(
                  tableCalenderButtonColor: Colors.green,
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
                    primaryColor: Colors.green,
                    buttonTheme:
                        ButtonThemeData(textTheme: ButtonTextTheme.primary),
                    colorScheme: ColorScheme.light(primary: Colors.green)
                        .copyWith(secondary: Colors.green),
                  ),
                  selectedColor: Colors.green,
                  onDateSelected: (date) {
                    selectedDate = date;
                  }),
            ),
            SizedBox(height: 20),
            Text("No Records Found")
          ],
        ));
  }
}
