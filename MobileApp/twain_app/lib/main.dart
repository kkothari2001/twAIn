import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('252525'),
        title: Text(
          'twAIn',
          style: TextStyle(
            fontFamily: 'Firacode'
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: HexColor('252525'),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '> Username : ',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Firacode'
                              ),
                            ),
                            Text(
                              'GoogleKarnaHamseSikho',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Firacode',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '> Password : ',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Firacode'
                              ),
                            ),
                            Text(
                              '*****',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Firacode',
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0, 10, 15, 10),
                decoration: BoxDecoration(
                  color: HexColor('363636'),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Type here',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Firacode'
                    ),
                    border: InputBorder.none,
                    
                  ),
                  cursorColor: Colors.green,
                  cursorWidth: 5.0,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Firacode'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}