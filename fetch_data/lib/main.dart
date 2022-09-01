import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data Using Dio"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Center(
          child: FloatingActionButton(
              onPressed: () {
                fetchData();
              },
              child: Icon(Icons.add)),
        ),
      ]),
    ));
  }

  void fetchData() async {
    var dio = Dio();
    String url = "https://jsonplaceholder.typicode.com/users";
    var response = await dio.get(url);

    // print(response.statusCode);

    print(response.isRedirect);
    print(response.data.toString());
    if (response.statusCode == 200) {
      print(response.statusMessage);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
