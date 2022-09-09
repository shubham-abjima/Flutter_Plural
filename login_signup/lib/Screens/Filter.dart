import 'dart:ffi';
import 'dart:ui';

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

List<String> localData = [
  'One',
  'Two',
  'Three',
  'Four',
  'Five',
  'Six',
  'Seven',
  'Eight',
  'Nine',
  'Ten',
];

class _FilterState extends State<Filter> {
  Map<String, String> selectedValueMap = Map();

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
            child: InkWell(
          child: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                    child: Text(
                      "SEARCH BY LOCATION",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),

              // DropdownSearch(
              //   items: ["Brazil", "France", "Tunisia", "Canada"],
              //   onChanged: print,
              //   selectedItem: "Tunisia",
              //   validator: (String item) {
              //     if (item == null)
              //       return "Required field";
              //     else if (item == "Brazil")
              //       return "Invalid item";
              //     else
              //       return null;
              //   },
              // ),
              Container(),
              Container(
                child: Text("Hello"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                    child: Text(
                      "DATE RANGE",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
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
                      onPressed: () {},
                      child: Text(
                        "CUSTOM",
                        style: TextStyle(fontSize: 12),
                      ),
                      splashColor: Colors.redAccent,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                    child: Text(
                      "SEARCH BY NAME",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'First Name',
                  ),
                  textAlign: TextAlign.left),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                    child: Text(
                      "SEARCH BY GENDER",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 0),
                    child: Text(
                      "SORT BY",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isDense: true,
                        iconEnabledColor: Color.fromARGB(255, 96, 8, 1),
                        dropdownColor: Color.fromARGB(255, 225, 223, 223),
                        value: selectedValue,
                        items: [
                          DropdownMenuItem(
                            child: Text("None"),
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
                      color: Color.fromARGB(255, 225, 223, 223),
                      height: 38,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.sort,
                            size: 27,
                          )),
                    ),
                  ],
                ),
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
          ),
        )));
  }
}
