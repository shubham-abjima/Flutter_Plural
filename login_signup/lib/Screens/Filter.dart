import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/Screens/HomeForm.dart';
import 'package:login_with_signup/Screens/HomePage.dart';

class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map<String, String> selectedValueMap = Map();
  DateTimeRange _selectedDateRange;

  // This function will be triggered when the floating button is pressed
  void _show() async {
    final DateTimeRange result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  @override
  void initState() {
    selectedValueMap["local"] = null;
    selectedValueMap["server"] = null;
    super.initState();
  }

  @override
  int selectedValue = 1;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'FILTER APPOINTMENT',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MyHomePage()),
                (Route<dynamic> route) => false),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/blur.jpg"),
              fit: BoxFit.none,
            ),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                  child: Text(
                    "SEARCH BY LOCATION",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    // hintText: 'Enter your name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.elliptical(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    fillColor: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 20, 0),
                  child: Text(
                    "DATE RANGE",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(11, 5, 10, 0),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    minWidth: 5,
                    onPressed: () => {},
                    child: Text(
                      "TODAY",
                      style: TextStyle(fontSize: 12),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                  FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    minWidth: 5,
                    onPressed: () {},
                    child: Text(
                      "7 DAYS",
                      style: TextStyle(fontSize: 12),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                  FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    minWidth: 5,
                    onPressed: () {},
                    child: Text(
                      "LAST MONTH",
                      style: TextStyle(fontSize: 12),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                  FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    minWidth: 5,
                    onPressed: () {
                      _show();
                    },
                    child: Text(
                      "CUSTOM",
                      style: TextStyle(fontSize: 12),
                    ),
                    splashColor: Colors.redAccent,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Start date
                Container(
                  width: 150,
                  height: 30,
                  child: FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    onPressed: () {
                      _show();
                    },
                    child: Text(
                      "${_selectedDateRange?.start.toString().split(' ')[0]}",
                      style: const TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),

                // End date
                Container(
                  width: 150,
                  height: 30,
                  child: FlatButton(
                    color: Color.fromARGB(255, 225, 223, 223),
                    onPressed: () {
                      _show();
                    },
                    child: Text(
                        "${_selectedDateRange?.end.toString().split(' ')[0]}",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black)),
                  ),
                ),

                Container(
                  child: Icon(Icons.calendar_month_rounded),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 20, 0),
                  child: Text(
                    "SEARCH BY NAME",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'First & Last Name',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.elliptical(20.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 20, 0),
                  child: Text(
                    "SEARCH BY GENDER",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.male,
                      color: Colors.black,
                    ), // Your icon here
                    label: Text(
                      "MALE",
                      style: TextStyle(color: Colors.black),
                    ), // Your text here
                    onPressed: () {},
                  ),
                  RaisedButton.icon(
                    icon: Icon(
                      Icons.female,
                      color: Colors.orange,
                    ), // Your icon here
                    label: Text(
                      "FEMALE",
                      style: TextStyle(color: Colors.black),
                    ), // Your text here
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text(
                      "ALL",
                      style: TextStyle(color: Colors.black),
                    ), // Your text here
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 20, 0),
                  child: Text(
                    "SORT BY",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: DropdownButton(
                        alignment: Alignment.center,
                        iconSize: 30,
                        isDense: false,
                        iconEnabledColor: Colors.black,
                        dropdownColor: Color.fromARGB(255, 225, 223, 223),
                        value: selectedValue,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "None",
                            ),
                            value: 0,
                          ),
                          DropdownMenuItem(
                            child: Text("FirstName"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("LastName"),
                            value: 2,
                          ),
                          DropdownMenuItem(child: Text("Gender"), value: 3),
                          DropdownMenuItem(
                            child: Text("Date"),
                            value: 4,
                          ),
                          DropdownMenuItem(
                            child: Text("DateTime"),
                            value: 5,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        color: Colors.transparent,
                        height: 38,
                        width: 38,
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                          size: 25,
                        )),
                  ]),
            ),
            Container(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  FlatButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => MyHomePage()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "FILTER",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                ]),
              ),
              height: 50,
              color: Color.fromARGB(255, 225, 223, 223),
            ),
          ]),
        )));
  }
}
