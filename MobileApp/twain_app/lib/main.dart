import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twain_app/commons/HexColor.dart';
import 'package:twain_app/model/command_model.dart';
import 'package:twain_app/model/gen_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';


/*
 * Commands : 
 * cd, ls, clear, help, about
 * 
 */

String aboutString = "This app is for the project being made by Team GoogleKarnaHamseSikho.\nWelcome to twAIn - A Story Generator powered by AI\n\nCreators :\n Ravi 🦉\n Kush 🐒\n Shreyas 🦊\n Nikheel 🦅\n\nMentors :\n Mehdi Patel\n Anuj Raghani\n Owais Hetavkar";
String sampleGeneratedStory = "He was the king of that place. Still he didn't knew how to figth with the enemies, as the anger among the people rose, the king tried to kill them. The King was not a good person. Once he murdered one of his soldier because he doubt him for stealing money. But the truth was the King's wife was stealing all the moeny.";

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
      tempNextOutput = Command(preCommand: '', command: 'Here are a list of commands you can try :\n\n =>cd - Change Directory.\n =>ls - List everything.\n =>clear - Clear the termial.\n =>about - To know about us.\n And lots of easter eggs to discover.', type: 1);
    }
    break;
    case 'ls' : {
      if(curDir == '/'){ tempNextOutput = Command(preCommand: '', command: 'project  folder2  memes', type: 1); }
      else if(curDir == '/project/'){ tempNextOutput = Command(preCommand: '', command: 'lstm  gpt2', type: 1); }
      else if(curDir == '/folder2/'){ tempNextOutput = Command(preCommand: '', command: '', type: 1); }
      else if(curDir == '/memes/'){ tempNextOutput = Command(preCommand: '', command: '', type: 1); }
      else if(curDir == '/project/lstm/'){ tempNextOutput = Command(preCommand: '', command: './storyGen', type: 1); }
      else if(curDir == '/project/gpt2/'){ tempNextOutput = Command(preCommand: '', command: './story-gen-gpt2', type: 1); }
    }
    break;

    case 'clear' : {
      tempNextOutput = Command(preCommand: '', command: "You can't clear this so easily 😁\nHint : 4 creatures that build this world. ", type: 1);
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
  List<GenModel> genHistories = [];
  String curDir = '/';
  bool isGenModeOn = false;
  String inputTextStory = "";
  String outputStory = "";
  String loadingState = "send";   // (send,load,speak)
  FlutterTts flutterTts = FlutterTts();

  void scrollToBottom(context) {
    print('after rebuild');
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<String> fetchGeneratedStory() async{
    final res = await http.get('https://thawing-springs-95929.herokuapp.com/api/adventure?inputText=$inputTextStory');
    if(res.statusCode == 200){
      return (json.decode(res.body)['OutputStory']);
    }else{
      return 'error';
    }
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

    if(commandtyped == './storyGen' && curDir == '/project/lstm/'){
      //sitch on gen mode
      changeGenMode(true); // gen mode on!!
      GenModel tempStartHeader = GenModel(type: 0, question: "===============\n==== twAIn ====\n==== v.1.0 ====\n===============", optionsText: null, inputText: null);
      genHistories.add(tempStartHeader);
      GenModel tempFirstQuestion = GenModel(question: 'Story Genre : ', optionsText: '(Adventure, Horror, Mystery)', inputText: '_', type: 1);
      genHistories.add(tempFirstQuestion);
      commandController.clear();
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

  

  void setGenHistory() async {
    GenModel tempGen; 
    GenModel extraGen;
    
    if(genHistories.length == 2){
      genHistories[genHistories.length - 1].inputText = commandController.text;
      print('-------------------------------------');
      print(genHistories[genHistories.length - 1].inputText);
      tempGen = GenModel(question: 'Story Length :', optionsText: '(Short, Medium, Long)', inputText: '_', type: 1);
    }else if(genHistories.length == 3){
      genHistories[genHistories.length - 1].inputText = commandController.text;
      tempGen = GenModel(question: 'Start of the Story :', optionsText: null, inputText: '_', type: 1);
    }else if(genHistories.length == 4){  // the story input is to be taken now
      genHistories[genHistories.length - 1].inputText = commandController.text;
      inputTextStory = genHistories[genHistories.length - 1].inputText;
      // fetch output story
      setState(() {
        loadingState = "load";
      });
      outputStory = await fetchGeneratedStory();
      tempGen = GenModel(question: 'Generated Story :', optionsText: null, inputText: outputStory, type: 1);
      extraGen = GenModel(question: 'Type R, to read the story aloud.', optionsText: null, inputText: null, type: 2);
      setState(() {
        loadingState = "send";
      });
    }else if(genHistories.length >= 5){
      if(commandController.text == "R" || commandController.text == "r"){
        flutterTts.setStartHandler(() {
          setState(() {
            loadingState = "speak";
          });
        });

        flutterTts.setCompletionHandler(() {
          setState(() {
            loadingState = "send";
          });
        });
        var result = await flutterTts.speak(outputStory);
      }else if(commandController.text == "exit"){
        setState(() {
          isGenModeOn = false;
          genHistories.clear();
        });
      }
    }
    setState(() {
      if(tempGen != null){
        genHistories.add(tempGen);
      }
      if(extraGen != null){
        genHistories.add(extraGen);
      }
      commandController.clear();
    });
  }

  void changeGenMode(bool whatToSet){
    setState(() {
      isGenModeOn = whatToSet;
    });
  }

  Widget sendBtnStatus(){
    if(loadingState == "send"){
      return InkWell(
                        onTap: () {
                          if(isGenModeOn){
                            setGenHistory();
                          }else{
                            setHistory();
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.green,
                          size: 30,
                        ));
    }else if(loadingState == "load"){
      return SpinKitRing(size : 22.0, color: Colors.white, lineWidth: 3);
    }else if(loadingState == "speak"){
      return SpinKitWave(size : 20.0, color: Colors.white);
    }
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
                  itemCount: (isGenModeOn) ? genHistories.length : histories.length,
                  itemBuilder: (context, index) {
                    print('list to be builded!');
                    if(isGenModeOn){
                      if(genHistories[index].type == 0){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            genHistories[index].question,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Firacode'),
                          ),
                        );
                      }else if(genHistories[index].type == 1){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '> ${genHistories[index].question}',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Firacode'),
                              ),
                              (genHistories[index].optionsText != null) ?
                              Text(
                                '   ${genHistories[index].optionsText} : ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Firacode'),
                              ) : Container(),
                              Text(
                                '   => ${genHistories[index].inputText} ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Firacode'),
                              ),
                            ],
                          )
                        );
                      }else if(genHistories[index].type == 2){
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            '   >> ${genHistories[index].question}',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Firacode'),
                          ),
                        );
                      }
                    }else{
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
                    sendBtnStatus(),
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
