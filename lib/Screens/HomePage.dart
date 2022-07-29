import 'package:flutter/material.dart';
import 'SpeachToTextPage.dart';
import 'TextToSpeechPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Converter'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RawMaterialButton(
              fillColor: Colors.blue,
                child: Text('Speech To Text'),
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                onPressed: (){
                Navigator.push(context,  MaterialPageRoute(builder: (context)=>SpeechToTextPage()));
                }),
            const SizedBox(
              height: 10,
            ),
            RawMaterialButton(
                fillColor: Colors.blue,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                child: Text('Text to Speech'),
                onPressed: (){
                  Navigator.push(context,  MaterialPageRoute(builder: (context)=>TextToSpeechPage()));
                })
          ],
        ),
      ),
    ));
  }
}
