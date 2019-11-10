import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QuizPage extends StatelessWidget {
  String word;
  FlutterTts flutterTts;
  QuizPage(String word) {
    this.word = word;
    this.flutterTts = new FlutterTts();
    this.flutterTts.setSpeechRate(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Quiz"),
      ),
      body: Center(
        child: Text(this.word, style: TextStyle(fontSize: 40),),
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: speak,
        tooltip: 'Increment',
        child: Icon(Icons.help),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void speak() async {
    await flutterTts.speak("This is the word " + this.word);
  }
}