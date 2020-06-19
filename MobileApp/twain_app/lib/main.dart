import 'package:flutter/material.dart';
import 'package:twain_app/pages/HomePage.dart';
import 'package:twain_app/pages/SplashScreen.dart';
import 'package:twain_app/pages/cliPage.dart';
import 'package:twain_app/pages/guiPage.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashScreen(),
        '/home' : (context) => HomePage(),
        '/gui' : (context) => GUIPage(),
        '/cli' : (context) => Home(),
      },
    )
);