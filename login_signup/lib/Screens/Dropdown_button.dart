import 'package:flutter/material.dart';

import 'package:login_with_signup/Screens/Upload_file.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        alignment: Alignment.center,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
        ),
        iconEnabledColor: Colors.green,
        value: selectedValue,
        items: [
          DropdownMenuItem(
            child: InkWell(
              child: Container(
                child: Text(
                  "Corp",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: InkWell(
              child: Container(
                  child:
                      Text("CVR-AK-Anchorage", style: TextStyle(fontSize: 13))),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UploadImageScreen()));
              },
            ),
          ),
          DropdownMenuItem(
            child: InkWell(
              child: Text("CVR-AK-Fairbanks", style: TextStyle(fontSize: 13)),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UploadImageScreen()));
              },
            ),
            value: 3,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AL-Dothan", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 4,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AL-Fairhope", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 5,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AL-Hoover", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 6,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AL-Mobile", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 7,
          ),
          DropdownMenuItem(
            child: InkWell(
                child:
                    Text("CVR-AL-Mantgomery", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 8,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AL-Opelika", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 9,
          ),
          DropdownMenuItem(
            child: InkWell(
                child:
                    Text("CVR-AL-Trussville", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 10,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AZ-Gilbert", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 11,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AZ-Mesa", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 12,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-AZ-Phoenix", style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 13,
          ),
          DropdownMenuItem(
            child: InkWell(
                child: Text("CVR-DC1-lrving Street",
                    style: TextStyle(fontSize: 13)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UploadImageScreen()));
                }),
            value: 14,
          ),
          DropdownMenuItem(
              child: InkWell(
                  child: Text("Others", style: TextStyle(fontSize: 13)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UploadImageScreen()));
                  }),
              value: 15),
        ],
        onChanged: (value) {
          setState(() {
            value = selectedValue;
          });
        });
  }
}
