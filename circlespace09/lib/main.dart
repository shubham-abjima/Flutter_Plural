// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FlutterWebViewApp extends StatefulWidget {
  const FlutterWebViewApp({key}) : super(key: key);

  @override
  _FlutterWebViewAppState createState() => _FlutterWebViewAppState();
}

class _FlutterWebViewAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(color: Colors.black,
          child: SafeArea(


            child: WebView(
              initialUrl: "https://www.centerforvein.com/",
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(FlutterWebViewApp());
}


// void main() {
//   runApp(
//       MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//             body: WebView(
//               initialUrl: "https://circlespace.tutorhere.in/",
//               javascriptMode: JavascriptMode.unrestricted,
//             )

//         ),
//       )
//   );

// }