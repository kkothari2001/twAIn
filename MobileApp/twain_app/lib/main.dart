import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twain_app/pages/AboutPage.dart';
import 'package:twain_app/pages/HomePage.dart';
import 'package:twain_app/pages/SplashScreen.dart';
import 'package:twain_app/pages/cliPage.dart';
import 'package:twain_app/pages/guiPage.dart';

Future main() async{
  await DotEnv().load('.env');
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashScreen(),
          '/home' : (context) => HomePage(),
          '/gui' : (context) => GUIPage(),
          '/cli' : (context) => Home(),
          '/about' : (context) => AboutPage(),
        },
    )
  );
}