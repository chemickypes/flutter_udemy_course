import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';

import 'question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _index = 0;

  var questions = [
    {
      'questionText': "What's your favorite book?",
      'answers': ['Book 1', 'Book 2', 'Book 3', 'Book 4']
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': ['Lion', 'Rabbit', 'Snake', 'Elephant']
    },
    {
      'questionText': "What's your favorite color?",
      'answers': ['Black', 'Blue', 'Green', 'White']
    },
    {
      'questionText': "Who's your favorite instructor?",
      'answers': ['Max', 'Max', 'Max', 'Max']
    },
  ];

  void _answerQuestion() {
    setState(() {
      _index += 1;
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
              questionText: questions[_index]['questionText'],
            ),
            ...(questions[_index]['answers'] as List<String>).map((answer) {
              return Answer(
                text: answer,
                onPressed: _answerQuestion,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
