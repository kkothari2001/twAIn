import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:twain_app/commons/HexColor.dart';
import 'package:http/http.dart' as http;

String sampleStory = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt, arcu sed gravida euismod, ipsum lacus rutrum augue, sed posuere mi lectus non mi. Proin lacinia est sit amet nunc aliquet mattis. Sed sit amet nibh sit amet lacus aliquet mattis quis et enim. Maecenas consequat vitae risus ut faucibus. Donec scelerisque, metus non aliquam rhoncus, diam augue pharetra mi, sed feugiat magna nisl interdum leo. Fusce nulla lectus, consectetur in viverra et, venenatis ut quam. Vestibulum non blandit turpis. Phasellus condimentum ligula vitae iaculis sodales. Nulla feugiat, enim at luctus pellentesque, lectus diam commodo diam, eu gravida nisl libero et nisi. Nullam augue risus, ultrices nec magna sit amet, dignissim placerat erat. Etiam vitae venenatis enim, quis finibus justo. Aliquam in elit pulvinar nibh lobortis consequat. Cras rhoncus massa vitae libero sollicitudin elementum. Praesent nec est convallis, tristique tortor ut, blandit est. Vestibulum eu massa in augue pharetra commodo vestibulum eget tortor. In in ipsum sed nisi euismod pellentesque. Donec consectetur, dolor vitae hendrerit eleifend, leo mi dictum dui, non vestibulum velit ante dictum magna. Ut mollis tempor leo non dignissim. In orci lorem, dignissim iaculis iaculis fringilla, mattis et sapien. Aenean est orci, consectetur ut luctus non, scelerisque eu ante. Cras tempor est et sapien mollis, quis suscipit diam tristique. Nunc tristique felis at felis convallis imperdiet.Sed in tellus ultricies massa hendrerit commodo. Sed scelerisque, nisl ac viverra commodo, leo orci laoreet nunc, ac rhoncus lacus tellus eu libero. In diam mauris, dictum eu porta at, interdum finibus ligula. Nunc nec lacus varius, condimentum ex vel, faucibus massa. Praesent tristique vitae risus eu facilisis. Fusce nulla nibh, mollis eget dolor non, porta lobortis erat. Suspendisse quis commodo ex. Phasellus malesuada, odio nec semper volutpat, sapien diam consequat turpis, quis faucibus lectus purus ultrices lectus. Nullam sagittis blandit nunc, in mattis turpis feugiat at. Donec commodo dapibus augue, non mattis tellus tincidunt eget. Vestibulum tincidunt dui eu vestibulum lacinia. Duis lacinia ligula lorem, et faucibus urna dapibus tempus. Quisque tellus odio, malesuada sed orci et, rutrum varius massa.";

class GUIPage extends StatefulWidget {
  @override
  _GUIPageState createState() => _GUIPageState();
}

class _GUIPageState extends State<GUIPage> {

  TextEditingController _inputStoryContoller = new TextEditingController();
  int _genreIndex = 0;
  int _lengthIndex = 0;
  String _outputStory = "twAIn is ready to write a story for you :)";
  bool _isStoryEmpty = true;
  bool _isLoadingStory = false;
  bool _isSpeaking = false;
  FlutterTts flutterTts = FlutterTts();
  

  HexColor selectedButtonColor = HexColor('22F52A');
  HexColor nonSelectedButtonColor = HexColor('2F2F2F');

  TextStyle selectedButtonText = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('2F2F2F'));
  TextStyle nonSelectedButtonText = TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: HexColor('D8D8D8'));

  Future<String> fetchGeneratedStory() async{
    setState(() {
      _isLoadingStory = true;
    });
    final res = await http.get('http://192.168.43.44:5000/api/gpt2?input=${_inputStoryContoller.text}');
    if(res.statusCode == 200){
      String tempString = res.body;
      tempString.replaceAll(RegExp('_'), "");
      setState(() {
        _outputStory = tempString;
      });
      //print(tempString);
      //return (json.decode(res.body);
    }else{
      _outputStory = "Some Error is occurred, twAIn can't think anymore.";
    }
    setState(() {
      _isLoadingStory = false;
      _isStoryEmpty = false;
    });
  }

  void setGenreIndex(int _gIndex){
    setState(() {
      _genreIndex = _gIndex;
    });
  }
  void setLengthIndex(int _lIndex){
    setState(() {
      _lengthIndex = _lIndex;
    });
  }

  void speakOutput() async{
    flutterTts.setStartHandler(() {
      setState(() {
        _isSpeaking = true;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
      });
    });
    await flutterTts.setPitch(1.4);
    var result = await flutterTts.speak(_outputStory);
  }

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
            Padding(
              padding: const EdgeInsets.fromLTRB(20,12,20,12.0),
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 10, 15, 10),
                decoration: BoxDecoration(
                    color: HexColor('2F2F2F'),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  //mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _inputStoryContoller,
                          decoration: InputDecoration(
                            hintText: ' Start the story...',
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey, fontFamily: 'Firacode'),
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.green,
                          cursorWidth: 5.0,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white, fontFamily: 'Firacode'),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          fetchGeneratedStory();
                         },
                        child: Icon(
                          Icons.send,
                          color: HexColor('22F52A'),
                          size: 30,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,8),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {setGenreIndex(0);},
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: (_genreIndex == 0) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Adventure', style: (_genreIndex == 0) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {setGenreIndex(1);},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: (_genreIndex == 1) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Horror', style: (_genreIndex == 1) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {setGenreIndex(2);},
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: (_genreIndex == 2) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Mystery', style: (_genreIndex == 2) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,8),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {setLengthIndex(0);},
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: (_lengthIndex == 0) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Short', style: (_lengthIndex == 0) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {setLengthIndex(1);},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: (_lengthIndex == 1) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Medium', style: (_lengthIndex == 1) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {setLengthIndex(2);},
                        child: Container(
                          margin: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: (_lengthIndex == 2) ? selectedButtonColor : nonSelectedButtonColor,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(child: Text('Long', style: (_lengthIndex == 2) ? selectedButtonText : nonSelectedButtonText))
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: HexColor('2F2F2F'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: (_isLoadingStory) ? Center(child: SingleChildScrollView(
                                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            // child: Rive(
                            //   filename: 'assets/images/netanim2.flr',
                            //   animation: 'Untitled',
                            // ),
                            child: FlareActor("assets/images/netanim2.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"Untitled"),
                          ),
                          //child: SpinKitThreeBounce(color: Colors.white, size : 40.0),
                        ),
                        Text("twAIn is thinking ...", style: TextStyle(fontSize: 18, color: HexColor('D8D8D8'), fontWeight: FontWeight.w600),)
                      ],
                    ),
                  )) :Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Text(_outputStory, textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: (_isStoryEmpty) ? Colors.grey : HexColor('D8D8D8')),)
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,8,20,20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){speakOutput();},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: (_isSpeaking) ? HexColor('22F52A') : HexColor('2F2F2F'),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: (_isSpeaking) ? SpinKitWave(size:22, color: HexColor('2F2F2F'),) : Icon(Icons.record_voice_over, color: HexColor('D8D8D8'),),
                        ))
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}