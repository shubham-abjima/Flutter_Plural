import 'dart:convert';

import "package:flutter/material.dart";
import 'package:login_with_signup/Screens/User.dart';
import 'package:http/http.dart' as http;

Future<List<User>> listUsers;

class Appointment extends StatelessWidget {
  const Appointment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<User> postList = [];

    Future<List<User>> getPostApi() async {
      String url = 'https://jsonplaceholder.typicode.com/posts';
      final resposne = await http.get(Uri.parse(url));
      var data = jsonDecode(resposne.body.toString());
      if (resposne.statusCode == 200) {
        postList.clear();
        for (Map i in data) {
          postList.add(User.fromJSON(i));
        }
        return postList;
      } else {
        return postList;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Appointment Info",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "APPOINTMENT DATE",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("26/09/2022")
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TIME",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("07:45-08:00")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ENC NUMBER",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("0")
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EVENT",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("Proc-Post Ablation FU Scan")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DATE OF BIRTH",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text("17/04/1985")
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 150,
                    child: Column(
                      children: [
                        Text(
                          "RACE",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text("White")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text(
                    ("ANTERIOR VIEW"),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Text(
                    ("POSTERIOR VIEW"),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Text(
                    ("LEFT VIEW"),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Text(
                    ("RIGHT VIEW"),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
