import 'package:flutter/material.dart';
import 'package:twain_app/model/history.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

Map<String, String> commandsBook = {
  'help' : 'Try \'ls\' and \'cd\' to navigate through the app.',
};


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
  TextEditingController commandController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  List<History> histories = [];
  String curDir = '/';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    History tempH = History(preCommand: 'test@V123' + curDir, command: '_', type: 0);
    histories.add(tempH);
  }

  void setHistory(){
    print('tap tap');
      String commandtyped = commandController.text.trim();
      // look thr my command book and check this command
      History nextOutput;

      if(commandtyped == 'help'){
        nextOutput = History(preCommand: '', command: 'Try \'ls\' and \'cd\' to navigate through the app.', type: 1);
      }else if(commandtyped.startsWith('cd')){
        nextOutput = null;
        String cdLoc = commandtyped.substring(3);
        if(cdLoc == 'project'){
          curDir = '/' + cdLoc + '/';
        }
      }else if(commandtyped == 'clear'){
        nextOutput = History(preCommand: '', command: '😈 You can\'t clear your past.', type: 1);
      }
      else{
        nextOutput = History(preCommand: '', command: 'Nothing like this exists.', type: 1);
      }

      setState(() {
        histories[histories.length - 1].command = commandtyped;
        if(nextOutput != null){
          histories.add(nextOutput);
        }
        History tempH = History(preCommand: 'test@V123' + curDir, command: '_', type: 0);
        histories.add(tempH);
        commandController.clear();
        
      });
      
  }

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
                  child: ListView.builder(
                    controller: _scrollController,
                    //reverse: true,
                    shrinkWrap: true,
                    itemCount: histories.length,
                    itemBuilder: (context, index){
                      if(histories[index].type == 0){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '> ${histories[index].preCommand} : ',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Firacode'
                                ),
                              ),
                              Text(
                                '${histories[index].command}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Firacode',
                                ),
                              ),
                            ],
                          ),
                        );
                      }else if(histories[index].type == 1){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  '${histories[index].command}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Firacode',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                    
                  ),
                  // child: Column(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: Row(
                  //         children: <Widget>[
                  //           Text(
                  //             '> Username : ',
                  //             style: TextStyle(
                  //               color: Colors.green,
                  //               fontWeight: FontWeight.w600,
                  //               fontFamily: 'Firacode'
                  //             ),
                  //           ),
                  //           Text(
                  //             'GoogleKarnaHamseSikho',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontFamily: 'Firacode',
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 10),
                  //       child: Row(
                  //         children: <Widget>[
                  //           Text(
                  //             '> Password : ',
                  //             style: TextStyle(
                  //               color: Colors.green,
                  //               fontWeight: FontWeight.w600,
                  //               fontFamily: 'Firacode'
                  //             ),
                  //           ),
                  //           Text(
                  //             '*****',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontFamily: 'Firacode',
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                      
                  //   ],
                  // ),
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
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: commandController,
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
                    InkWell(
                      onTap: (){
                        setHistory();
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      child: Icon(Icons.send, color: Colors.green, size: 30,)
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}