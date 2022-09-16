import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/genTextFormField.dart';
import 'package:login_with_signup/Screens/HomeForm.dart';
import 'package:login_with_signup/Screens/HomePage.dart';

class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
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

  var _searchview = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  List<String> _nebulae;
  List<String> _filterList;

  @override
  void initState() {
    selectedValueMap["local"] = null;
    selectedValueMap["server"] = null;

    super.initState();
    _nebulae = new List<String>();
    _nebulae = [
      "Orion",
      "Boomerang",
      "Cat's Eye",
      "Pelican",
      "Ghost Head",
      "Witch Head",
      "Snake",
      "Ant",
      "Bernad 68",
      "Flame",
      "Eagle",
      "Horse Head",
      "Elephant's Trunk",
      "Butterfly"
    ];
    _nebulae.sort();
  }

  _HomeState() {
    //Register a closure to be called when the object changes.
    _searchview.addListener(() {
      if (_searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
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
            SizedBox(
              height: 3,
            ),
            Container(
              color: Colors.transparent,
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: new Column(
                children: <Widget>[
                  _createSearchView(),
                  _firstSearch ? _createListView() : _performSearch()
                ],
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
                    onPressed: () {},
                    child: Text(
                      "TODAY",
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
                      "7 DAYS",
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
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: new TextStyle(color: Colors.grey[300]),
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
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: new TextStyle(color: Colors.grey[300]),
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
                      Icons.man_outlined,
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
                      Icons.woman_outlined,
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

  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: new TextField(
        cursorHeight: 25,
        style: TextStyle(color: Colors.white),
        controller: _searchview,
        decoration: InputDecoration(),
        textAlign: TextAlign.center,
      ),
    );
  }

  //Create a ListView widget
  Widget _createListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _nebulae.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              child: new Container(
                child: new Text("${_nebulae[index]}"),
              ),
            );
          }),
    );
  }

  //Perform actual search
  Widget _performSearch() {
    _filterList = new List<String>();
    for (int i = 0; i < _nebulae.length; i++) {
      var item = _nebulae[i];

      if (item.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  //Create the Filtered ListView
  Widget _createFilteredListView() {
    return new Flexible(
      child: new ListView.builder(
          itemCount: _filterList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              color: Colors.white,
              child: new Container(
                child: new Text("${_filterList[index]}"),
              ),
            );
          }),
    );
  }
}
