import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medmio/Models/Postmodel.dart';
import 'package:http/http.dart' as http;

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  // List<PostModel> postlist = [];
  // Future<List<PostModel>> getpPostApi() async {
  //   final response =
  //       await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map i in data) {
  //       postlist.add(PostModel.fromJson(i));
  //     }
  //     return postlist;
  //   } else {}
  // }

  late int tappedIndex;

  @override
  Widget build(BuildContext context) {
    var _currentIndex;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomAppBar(
              child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: const ImageIcon(NetworkImage(
                      "https://avatars.githubusercontent.com/u/112777230?s=200&v=4")),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 0
                      ? null
                      : () => setState(() => _currentIndex = 0)),
              IconButton(
                  icon: Icon(Icons.star),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 1
                      ? null
                      : () => setState(() => _currentIndex = 1)),
              IconButton(
                  icon: Icon(Icons.list_alt_outlined),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 2
                      ? null
                      : () => setState(() => _currentIndex = 2)),
            ],
          )),
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Text("DK"),
              ),
            ),
            title: const Text(
              "Dileep Kumar",
              style: TextStyle(fontSize: 15),
            ),
            actions: const [
              Center(child: Text("Annapolis")),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.share),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Text("PS")),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Prateek Sharma",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "09-29-2022 07:00 AM - 07:30 PM",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "MRN: 5468752",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "DOB: 31-01-1970",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Medicare MD",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              );
            },
          )),
    );
  }
}