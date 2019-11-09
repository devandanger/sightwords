import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuizPage extends StatelessWidget {
  String word;
  QuizPage(String word) {
    this.word = word;
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
  }
}