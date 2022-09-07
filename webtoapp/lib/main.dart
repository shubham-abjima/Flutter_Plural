import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
          title: Text("Center For Vein Restoration"),
          centerTitle: true,
        ),
        body: WebView(
          onWebResourceError: (error) {},
          backgroundColor: Colors.red,
          allowsInlineMediaPlayback: true,
          debuggingEnabled: true,
          initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
          initialUrl: "https://www.centerforvein.com/",
          javascriptMode: JavascriptMode.unrestricted,
          zoomEnabled: true,
        ),
      ),
    );
  }
}
