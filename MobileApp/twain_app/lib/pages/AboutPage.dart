import 'package:flutter/material.dart';
import 'package:twain_app/commons/HexColor.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor('#141414'),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 80,
              width: double.infinity,
              child: Center(child: Text('twAIn_', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('22F52A'))))
            ),
            Container(
              width: double.infinity,
              child: Center(child: Text('An AI that writes Stories.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))))
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Center(child: Text('"twAIn is an AI based app that can write beautiful stories. twAIn is created by group of 4 tech nerds for Coc Inheritance 2020 project. twAIn gets it\'s brain from a LSTM Model and Open AI\'s GPT-2 Model. It is trained on a corpus of 20 Novels of different Genres."', textAlign: TextAlign.justify ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))))
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
              width: double.infinity,
              child: Text('- twAIn', textAlign: TextAlign.right ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8')))
            ),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Center(child: Text('Creators', textAlign: TextAlign.justify ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))))
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 5),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(children: <Widget>[
                            Text('🦉', textAlign: TextAlign.right ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))),
                            Text('Ravi Maurya', textAlign: TextAlign.right ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8')))
                          ],)
                        ),
                        Container(
                          child: Column(children: <Widget>[
                            Text('🐒', textAlign: TextAlign.right ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))),
                            Text('Kush Kothari', textAlign: TextAlign.right ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8')))
                          ],)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(children: <Widget>[
                            Text('🦊', textAlign: TextAlign.right ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))),
                            Text('Shreyas Penkar', textAlign: TextAlign.right ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8')))
                          ],)
                        ),
                        Container(
                          child: Column(children: <Widget>[
                            Text('🦅', textAlign: TextAlign.right ,style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8'))),
                            Text('Nikheel Indanoor', textAlign: TextAlign.right ,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Firacode', color: HexColor('D8D8D8')))
                          ],)
                        ),
                      ],
                    ),
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
        ),
      ),
    );
  }
}