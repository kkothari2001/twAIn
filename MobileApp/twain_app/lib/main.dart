import 'package:flutter/material.dart';
import 'package:twain_app/commons/HexColor.dart';
import 'package:twain_app/model/command_model.dart';

/*
 * Commands : 
 * cd, ls, clear, help, about
 * 
 */

String aboutString = "This app is for the project being made by Team GoogleKarnaHamseSikho.\nWelcome to twAIn - A Story Generator powered by AI\n\nCreators :\nRavi 🦉\nKush 🐒\nShreyas 🦊\nNikheel 🦅";

void main() => runApp(MaterialApp(
      home: Home(),
    ));

Map<String, String> commandsBook = {
  'help': 'Try \'ls\' and \'cd\' to navigate through the app.',
};

List getOutputForThisCommand(String commandtyped, String curDir) {
  Command tempNextOutput;

  // if cd command
  if(commandtyped.startsWith('cd')){
    tempNextOutput = Command(preCommand: '', command: '', type: 1);
    String cdLoc = commandtyped.substring(3);
    if(curDir == '/'){
      if(cdLoc == 'project' || cdLoc == 'folder2' || cdLoc == 'memes') { curDir = '$curDir$cdLoc/'; }
      else { tempNextOutput.command = 'Nothing found like this.'; }
    }
    else if(curDir == '/project/'){
      if(cdLoc == 'lstm' || cdLoc == 'gpt2') { curDir = '$curDir$cdLoc/'; }
      else { tempNextOutput.command = 'Nothing found like this.'; }
    }
    else if(curDir == '/folder2/'){
      tempNextOutput.command = 'Nothing found like this.';
    }
    else if(curDir == '/memes/'){
      tempNextOutput.command = 'Nothing found like this.';
    }
    else if(curDir == '/project/lstm/'){
      tempNextOutput.command = 'Nothing found like this.';
    }
    else if(curDir == '/project/gpt2/'){
      tempNextOutput.command = 'Nothing found like this.';
    }
    return [tempNextOutput, curDir];
  }

  // If not cd command
  switch(commandtyped){
    case 'help' : {
      tempNextOutput = Command(preCommand: '', command: 'Try \'ls\' and \'cd\' to navigate through the app.', type: 1);
    }
    break;
    case 'ls' : {
      if(curDir == '/'){ tempNextOutput = Command(preCommand: '', command: 'project  folder2  memes', type: 1); }
      else if(curDir == '/project/'){ tempNextOutput = Command(preCommand: '', command: 'lstm  gpt2', type: 1); }
      else if(curDir == '/folder2/'){ tempNextOutput = Command(preCommand: '', command: '', type: 1); }
      else if(curDir == '/memes/'){ tempNextOutput = Command(preCommand: '', command: '', type: 1); }
      else if(curDir == '/project/lstm/'){ tempNextOutput = Command(preCommand: '', command: 'story-gen-lstm', type: 1); }
      else if(curDir == '/project/gpt2/'){ tempNextOutput = Command(preCommand: '', command: 'story-gen-gpt2', type: 1); }
    }
    break;

    case 'clear' : {
      tempNextOutput = Command(preCommand: '', command: '😈 You can\'t clear your past.', type: 1);
    }
    break;
    // This app is for the project being made by Team GoogleKarnaHamseSikho.\nWelcome to twAIn - A Story Generator powered by AI\n\nCreators :\nRavi 🦉\nKush 🐒\nShreyas 🦊\nNikheel 🦅
    case 'about' : {
      tempNextOutput = Command(preCommand: '', command: aboutString, type: 1);
    }
    break;
    case 'fuck' : {
      tempNextOutput = Command(preCommand: '', command: 'That\'s Rude 🙁', type: 1);
    }
    break;

    default: {
      tempNextOutput = Command(preCommand: '', command: 'WTF Nothing like this exsits. 😝', type: 1);
    }
    break;
  }
  return [tempNextOutput, curDir];
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController commandController = TextEditingController();
  ScrollController _scrollController = new ScrollController();
  List<Command> histories = [];
  String curDir = '/';

  void scrollToBottom(context) {
    print('after rebuild');
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Command tempH =
        Command(preCommand: 'test@V123' + curDir, command: '_', type: 0);
    histories.add(tempH);
  }

  void setHistory() {
    print('send tapped');
    String commandtyped = commandController.text.trim();

    if(commandtyped == '🦉🐒🦊🦅'){
      histories.clear();
      setState(() {
        Command tempH =
            Command(preCommand: 'test@V123' + curDir, command: '_', type: 0);
        histories.add(tempH);
        commandController.clear();
      });
      return;
    }
    // Callout and get output
    List tempOutput = getOutputForThisCommand(commandtyped, curDir);
    Command nextOutput = tempOutput[0];
    curDir = tempOutput[1];

    if(commandtyped.startsWith('cd') && nextOutput.command==''){
      nextOutput = null;
    }

    setState(() {
      histories[histories.length - 1].command = commandtyped;
      if (nextOutput != null) {
        histories.add(nextOutput);
      }
      Command tempH =
          Command(preCommand: 'test@V123' + curDir, command: '_', type: 0);
      histories.add(tempH);
      commandController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(scrollToBottom);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('252525'),
        title: Text(
          'twAIn',
          style: TextStyle(fontFamily: 'Firacode'),
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
                    itemBuilder: (context, index) {
                      print('list to be builded!');
                      if (histories[index].type == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '> ${histories[index].preCommand} : ',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Firacode'),
                              ),
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
                      } else if (histories[index].type == 1) {
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
                    }),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0, 10, 15, 10),
                decoration: BoxDecoration(
                    color: HexColor('363636'),
                    borderRadius: BorderRadius.circular(10.0)),
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
                                color: Colors.grey, fontFamily: 'Firacode'),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.green,
                          cursorWidth: 5.0,
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Firacode'),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          setHistory();
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.green,
                          size: 30,
                        )),
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
