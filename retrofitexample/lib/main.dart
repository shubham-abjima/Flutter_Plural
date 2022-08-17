import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:retrofitexample/api_service.dart';
import 'package:retrofitexample/ui/my_home.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (context) => ApiService.create(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: MyHome(),
      ),
    );
  }
}
