import 'package:flutter/material.dart';
import 'package:flutter27july/pages/choose_location.dart';
import 'package:flutter27july/pages/home.dart';
import 'package:flutter27july/pages/loading.dart';

// Stateless: stless
// 1. State does not change over time.
// 2. Build function only runs once.

// Stateful: stful
// 1. State can change Over time.
// 2. SetState() trigger the build function.

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
