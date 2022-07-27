import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SpeechToText _stt = SpeechToText();
  bool isSpeechEnabled = false;
  bool isMicOpen=false;
  String text = 'Press the mic start Speaking';

  void startListening() async {
    isMicOpen=true;
    isSpeechEnabled = await _stt.initialize();
    await _stt.listen(
        onResult: (value) {
          print(value);
          text = value.recognizedWords;
          if(value.finalResult){
            isMicOpen=false;
          };// returns true when stop listening so mic should be closed that is false
          setState(() {
          });
        }
    );
  }

  void stopListening() async {
    isSpeechEnabled=false;
    isMicOpen=false;
    text = 'Press the mic start Speaking';
    await _stt.stop();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech to Text'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                text,
                style: TextStyle(
            fontSize: 20,
        )
            ),
            SizedBox(
              height: 10,
            ),
            AvatarGlow(
              glowColor: Colors.blueAccent,
              endRadius: 40,
              duration: Duration(milliseconds: 2000),
              repeatPauseDuration: Duration(milliseconds: 100),
              repeat: true,
              animate: isMicOpen,
              child: FloatingActionButton(
                tooltip: 'Listen',
                child: Icon(
                  isMicOpen ? Icons.mic : Icons.mic_off,
                  color: Colors.white,),
                onPressed: () {
                  setState(() {
                    _stt.isNotListening? startListening():stopListening() ;
                  });

                },
              ),
            )
          ],
        ),
      ),

    );
  }
}