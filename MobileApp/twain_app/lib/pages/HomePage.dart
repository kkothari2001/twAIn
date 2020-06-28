import 'package:flutter/material.dart';
import 'package:twain_app/commons/HexColor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('141414'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bghome.png"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('twAIn_',
                          style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Firacode',
                              color: HexColor('22F52A'))),
                      ),
                    Text('An AI that writes stories.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Firacode',
                        color: HexColor('D8D8D8')
                      )
                    )
                  ]
                )
              )
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                          color: HexColor('2F2F2F'),
                          borderRadius: BorderRadius.circular(10.0)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () {
                                Navigator.pushNamed(context, '/gui');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Icon(
                                        Icons.touch_app,
                                        color: HexColor('22F52A'),
                                        size: 35,
                                      ),
                                    ),
                                    Text(
                                      'GUI',
                                      style: TextStyle(
                                          fontFamily: 'Firacode',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                      SizedBox(height: 10.0),
                      Container(
                          decoration: BoxDecoration(
                              color: HexColor('2F2F2F'),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10.0),
                              onTap: () {
                                Navigator.pushNamed(context, '/cli');
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text('>_',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Firacode',
                                              color: HexColor('22F52A'))),
                                    ),
                                    Text(
                                      'Terminal',
                                      style: TextStyle(
                                          fontFamily: 'Firacode',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  )
                ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Made by:',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Firacode',
                                color: HexColor('D8D8D8'))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Team ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Firacode',
                                  color: HexColor('D8D8D8'))),
                          Text('GoogleKarnaHamseSikho',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Firacode',
                                  color: HexColor('22F52A'))),
                        ],
                      )
                    ]
                  )
                )
              ),
          ],
        )
      ),
    );
  }
}
