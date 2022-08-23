import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
        ),
        body: WebView(
          initialUrl: "https://www.geeksforgeeks.org/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
