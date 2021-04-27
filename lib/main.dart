import 'package:flutter/material.dart';
import 'package:flutterapp/mysqlphp/myApp.dart';
import 'package:flutterapp/pages/choose_location.dart';
import 'package:flutterapp/pages/loading.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/myApp',
  routes: {
    '/':(context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
    '/myApp': (context) => MyApp(),
  },
));





