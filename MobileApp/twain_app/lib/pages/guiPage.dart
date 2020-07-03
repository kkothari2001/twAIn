import 'package:dio/dio.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:twain_app/commons/HexColor.dart';
import 'package:http/http.dart' as http;
import 'package:twain_app/utils/settings.dart';

String sampleStory = "This is a sample Story. To generate custom story, follow the README file. \n\n\nAs i woke up i could see the island come into the dawn.\r\nThe blackness made me feel that the shore was\r\ncovering an awful flood.  I stood still and listened.\r\n\r\n\"There,\" said the captain, \"is the man with the leg.\"\r\n\r\nI stood and listened.  The captain said:\r\n\r\n\"Here is the man with the leg, I suppose.\"\r\n\r\n\"Well,\" said I, \"that's all very well.  Good day, all is well.\"\r\n\r\nIn fact, it was only a light rain and the sea was still.\r\n\r\nAfter some time I heard a great noise and I jumped to the shore.  The\r\nland was covered with the footprints of some of the dogs who had run off\r\nwith the man with the leg.  Once upon the shore, I saw a little boat\r\ntowards me, but it was not long before we came to a halt.\r\n\r\n\"Hurry,\" said the captain, \"let us come and see what is the matter with us.\"\r\n\r\n\"Captain, Captain!\" cried I, \"let us speed ahead, for we are\r\ngoing to see if we can get any news from the crew.\"\r\n\r\n\"Captain!\" cried the captain.  \"Captain!\" cried the captain again.\r\n\r\nI followed his orders, and I was about to go to the island when I\r\nheard a great noise as of a ship approaching.  I looked round and\r\nsaw the island covered with the footprints of the dogs, and the\r\nland was covered with their tracks and their tracks were\r\nstill there.  I looked about me and saw no one in view.\r\n\r\n\"Captain,\" cried I, \"we must hurry!\"\r\n\r\nThe captain said:\r\n\r\n\"We are coming back!\"\r\n\r\n\"Captain,\" said I, \"we must hurry!\"\r\n\r\n\"What are you talking about?\" said the captain.  \"Go on.\"\r\n\r\nI went on, and the captain let me go.  He said:\r\n\r\n\"Captain, we have got the signal.  We must hurry!\"\r\n\r\n\"We must hurry!\" cried I, \"however!\"\r\n\r\nThe captain said:\r\n\r\n\"I think we have got it.\"\r\n\r\n\"You think we have?\"\r\n\r\n\"I think we have.\"\r\n\r\n\"What about you thinks so?\"\r\n\r\n\"I think we have.\"\r\n\r\n\"Well, then, we must hurry!\"\r\n\r\nI did as the captain commanded.  We started and let the dogs go, and as\r\nwe came to the island we stopped.  We looked about us and there were\r\nno more dogs to see, but we were still about five or six miles\r\nnorth of the cape.\r\n\r\nThe dog tracks were gone, but the footprints were still there.  We\r\nthen looked about the island, and the fox was gone.  We looked like\r\nthe cannibals we were, and the dog tracks were gone, but the fox\r\nwas not.  We looked about the island, and the fox was gone.  We\r\nthen looked toward the cape, and the fox was gone.  We looked\r\nabout the island, and the fox was gone.\r\n\r\nWell, now we looked through the island\u2013the fox was gone, and the fox\r\ncould not be seen.  The sight of the fox drew our eyes back, and we\r\nsaw that the island was covered with the tracks of the dogs.\r\n\r\n\"Captain, tell me where the other dog tracks are,\" said I.\r\n\r\n\"Sir!\" said the captain, \"they will tell you.\"\r\n\r\nThe dog tracks were still there, but the fox was gone.  We looked\r\naround to see if we could find the fox, but the fox was gone.\r\n\r\nWell, now we looked around to see if we could find the fox, but the\r\nfox was gone.\r\n\r\n\"Captain, tell me where the other dog tracks are,\" said I.\r\n\r\n\"Sir!\" said the captain, \"they will tell you.\"\r\n\r\nThe dog tracks were still there, but the fox was gone.";

class GUIPage extends StatefulWidget {
  @override
  _GUIPageState createState() => _GUIPageState();
}

class _GUIPageState extends State<GUIPage> {

  TextEditingController _inputStoryContoller = new TextEditingController();
  int _genreIndex = 0;
  int _lengthIndex = 0;
  List<String> genreList = ['adventure', 'horror', 'mystery'];
  List<String> lengthList = ['short', 'medium', 'long'];
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
    if(MODE == 'sample'){
      setState(() {
        _outputStory = sampleStory;
      });
    }else{

      Map<String, String> qParams = {
        'inputText': _inputStoryContoller.text,
        'length': lengthList[_lengthIndex],
      };

      try {
        var _dio = new Dio();
        String url = "http://$IP_ADD:8000/api/${genreList[_genreIndex]}";
        var res = await _dio.get(url, queryParameters: qParams);
        if(res.statusCode == 200){
          String tempString = res.data['OutputStory'];
          tempString.replaceAll(RegExp('_'), "");
          setState(() {
            _outputStory = tempString;
          });
        }else{
          _outputStory = "Some Error is occurred, twAIn can't think anymore.";
        }
      } catch (e) {
        print("Error");
        _outputStory = "Some Error is occurred, twAIn can't think anymore.";
      }
      
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
    if(_isSpeaking){
      flutterTts.stop();
      setState(() {
        _isSpeaking = false;
      });
    }else{
      var result = await flutterTts.speak(_outputStory);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    flutterTts.stop();
    super.dispose();
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
                      onTap: (){
                        Navigator.pushNamed(context, '/about');
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: HexColor('2F2F2F'),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(Icons.more_horiz, color: HexColor('D8D8D8'),),
                        ))
                      ),
                    ),
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
                          child: (_isSpeaking) ? SpinKitWave(size:19, color: HexColor('2F2F2F'),) : Icon(Icons.record_voice_over, color: HexColor('D8D8D8'),),
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