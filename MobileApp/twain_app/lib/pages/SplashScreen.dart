import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twain_app/commons/HexColor.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: HexColor('141414'), // navigation bar color
    ));
    return Scaffold(
      backgroundColor: HexColor('141414'),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: FlareActor(
              "assets/images/splashanim.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "Untitled",
              callback: (name) {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
        ),
      ),
    );
  }
}