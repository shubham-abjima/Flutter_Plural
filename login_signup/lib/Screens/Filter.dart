import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_with_signup/Screens/HomePage.dart';

class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool _todayPressed = false;
  bool _daysPressed = false;
  bool _monthPressed = false;
  bool _male = false;
  bool _female = false;
  bool _all = false;
  bool _startDate = false;
  bool _endDate = false;
  bool _custom = false;

  Map<String, String> selectedValueMap = Map();
  DateTimeRange _selectedDateRange;

  // This function will be triggered when the floating button is pressed
  void _show() async {
    final DateTimeRange result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1974, 1, 1),
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

  void _today() async {
    DateTime today = DateTime.now();
  }

  void _month() async {
    DateTime pastMonth = DateTime.now().subtract(
      Duration(days: 30),
    );
  }

  void _days() async {
    DateTime pastWeek = DateTime.now().subtract(
      Duration(days: 7),
    );
  }

  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _searchlist;
  List<String> _filterList;

  @override
  void initState() {
    selectedValueMap["local"] = null;
    selectedValueMap["server"] = null;

    super.initState();
    _searchlist = new List<String>();
    _searchlist = [
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
    ];
    _searchlist.sort();
  }

  _FilterState() {
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchview.text;
        });
      }
    });
  }

  @override
  int selectedValue = 1;
  var selectedDate;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Text(
            'FILTER APPOINTMENT',
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/blur.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
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
                RawAutocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    } else {
                      List<String> matches = <String>[];
                      matches.addAll(_searchlist);

                      matches.retainWhere((s) {
                        return s
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                      return matches;
                    }
                  },
                  onSelected: (String selection) {
                    print('You just selected $selection');
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          hintText: "Search Location",
                          hintStyle: TextStyle(color: Colors.grey[300]),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            // borderRadius: BorderRadius.all(Radius.elliptical(20.0)),
                          ),
                        ),
                        controller: textEditingController,
                        cursorColor: Colors.white,
                        focusNode: focusNode,
                        onSubmitted: (String value) {},
                      ),
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      void Function(String) onSelected,
                      Iterable<String> options) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 430, left: 9, right: 12),
                      child: Material(
                          color: Color.fromARGB(255, 214, 213, 213),
                          child: SingleChildScrollView(
                            child: Column(
                              children: options.map((opt) {
                                return InkWell(
                                    onTap: () {
                                      onSelected(opt);
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(),
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          opt,
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ));
                              }).toList(),
                            ),
                          )),
                    );
                  },
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
                      MaterialButton(
                        color: _todayPressed
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        minWidth: 5,
                        onPressed: () {
                          setState(() {
                            _todayPressed = !_todayPressed;
                            _today();
                          });
                        },
                        child: Text(
                          "TODAY",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      MaterialButton(
                        color: _daysPressed
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        minWidth: 5,
                        onPressed: () {
                          setState(() {
                            _daysPressed = !_daysPressed;
                            _days();
                          });
                        },
                        child: Text(
                          "7 DAYS",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      MaterialButton(
                        color: _monthPressed
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        minWidth: 5,
                        onPressed: () {
                          setState(() {
                            _monthPressed = !_monthPressed;
                            _month();
                          });
                        },
                        child: Text(
                          "LAST MONTH",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      MaterialButton(
                        color: _custom
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        minWidth: 5,
                        onPressed: () {
                          setState(() {
                            _custom = !_custom;
                            _show();
                          });
                        },
                        child: Text(
                          "CUSTOM",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Start date
                      Container(
                        width: 150,
                        height: 30,
                        child: MaterialButton(
                          color: _startDate
                              ? Colors.green
                              : Color.fromARGB(255, 225, 223, 223),
                          onPressed: () {
                            setState(() {
                              _startDate = !_startDate;
                              _show();
                            });
                          },
                          child: Text(
                            "${_selectedDateRange?.start.toString().split(' ')[0]}",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),

                      // End date
                      Container(
                        width: 150,
                        height: 30,
                        child: MaterialButton(
                          color: _startDate
                              ? Colors.green
                              : Color.fromARGB(255, 225, 223, 223),
                          onPressed: () {
                            setState(() {
                              _endDate = !_endDate;
                              _show();
                            });
                          },
                          child: Text(
                              "${_selectedDateRange?.end.toString().split(' ')[0]}",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black)),
                        ),
                      ),

                      Container(
                        child: Icon(Icons.calendar_month_rounded, size: 30),
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
                        "SEARCH BY NAME",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: new TextStyle(color: Colors.grey[300]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          // borderRadius: BorderRadius.all(Radius.elliptical(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: new TextStyle(color: Colors.grey[300]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                            // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                          // borderRadius: BorderRadius.all(Radius.elliptical(20.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton.icon(
                        color: _male
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        icon: Icon(Icons.man_outlined,
                            color: Colors.black), // Your icon here
                        label: Text(
                          "MALE",
                          style: TextStyle(color: Colors.black),
                        ), // Your text here
                        onPressed: () {
                          setState(() {
                            _male = !_male;
                          });
                        },
                      ),
                      RaisedButton.icon(
                        color: _female
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        icon: Icon(
                          Icons.woman_outlined,
                          color: Colors.orange,
                        ), // Your icon here
                        label: Text(
                          "FEMALE",
                          style: TextStyle(color: Colors.black),
                        ), // Your text here
                        onPressed: () {
                          setState(() {
                            _female = !_female;
                          });
                        },
                      ),
                      RaisedButton(
                        color: _all
                            ? Colors.green
                            : Color.fromARGB(255, 225, 223, 223),
                        child: Text(
                          "ALL",
                          style: TextStyle(color: Colors.black),
                        ), // Your text here
                        onPressed: () {
                          setState(() {
                            _all = !_all;
                          });
                        },
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
                            iconSize: 20,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.white,
                            ),
                            isDense: true,
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
                              CupertinoIcons.sort_down,
                              color: Colors.black,
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
                      MaterialButton(
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
          ),
        )));
  }
}
