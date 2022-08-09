import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Wait Validating Ip.',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),
      ),
      seconds: 5,
      navigateAfterSeconds: new AfterSplash(),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: WebView(
        initialUrl: "https://circlespace.tutorhere.in",
        javascriptMode: JavascriptMode.unrestricted,
      ) ,
    );

  }
}

