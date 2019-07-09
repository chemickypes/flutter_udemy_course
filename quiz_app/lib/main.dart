import 'package:flutter/material.dart';

import 'fancy_button.dart';
import 'question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  int _index = 0;
  
  var questions = <String> [
    "What's your favorite book?",
    "what's your favorite animal?"
  ];

  void _answerQuestion() {
    setState(() {
     _index +=1; 
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QuizApp!'),
        ),
        body: Column(
          children: <Widget>[
            QuestionWidget(
              questionText: questions[_index],
              ),
            FancyButton(
              text: 'Answer 1',
              onPressed: _answerQuestion,
            ),
            FancyButton(
              text: 'Answer 2',
              onPressed: _answerQuestion,
            ),
            FancyButton(
              text: 'Answer 3',
              onPressed: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}



