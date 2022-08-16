import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:retrofittest/api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrofit Get Call"),
      ),
      body: _buildBody(context),
    );
  }
}

FutureBuilder<Post> _buildBody(BuildContext context) {
  final client = RestClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<Post>(
    future: client.getTasks(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        var posts = snapshot.data;
        return _buildPosts(context, posts!);
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

Widget _buildPosts(BuildContext context, Post posts) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Name : " + posts.name,
          style: TextStyle(fontSize: 30),
        ),
        Text(
          "Age : " + posts.age.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ],
    ),
  );
}
