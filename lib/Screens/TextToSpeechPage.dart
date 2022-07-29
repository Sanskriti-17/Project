import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({Key? key}) : super(key: key);

  @override
  State<TextToSpeechPage> createState() => _TextToSpeechPageState();
}

class _TextToSpeechPageState extends State<TextToSpeechPage> {
  final TextEditingController _controller= TextEditingController();
  final FlutterTts _tts = FlutterTts();

  whileSpeaking(String text)async {
    await _tts.setLanguage('en-US');
    await _tts.setPitch(1.0);
    await _tts.speak(text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your text here',
                  hintStyle: TextStyle(
                    color: Colors.black45,
                  )
                ),
                controller: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                    fillColor: Colors.blue,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    child: const Text('Speak'),
                    onPressed: (){
                      whileSpeaking(_controller.text);
                    }),
                const SizedBox(
                  width: 20,
                ),
                RawMaterialButton(
                    fillColor: Colors.blue,
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    child: const Text('Clear'),
                    onPressed: (){
                      setState(() {
                        _controller.clear();
                      });
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

