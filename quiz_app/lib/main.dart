import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  int _totalScore = 0;

  final questions = const [
    {
      'questionText': "What's your favorite book?",
      'answers': [
        {'text': 'Book 1', 'score': 1},
        {'text': 'Book 2', 'score': 4},
        {'text': 'Book 3', 'score': 5},
        {'text': 'Book 4', 'score': 10}
      ]
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Lion', 'score': 1},
        {'text': 'Elephant', 'score': 4},
        {'text': 'Dog', 'score': 5},
        {'text': 'Snake', 'score': 10}
      ]
    },
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'White', 'score': 4},
        {'text': 'Purple', 'score': 5},
        {'text': 'Orange', 'score': 10}
      ]
    },
    {
      'questionText': "Who's your favorite instructor?",
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Carl', 'score': 4},
        {'text': 'George', 'score': 5},
        {'text': 'Romeo', 'score': 10}
      ]
    },
  ];

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _index += 1;
    });
  }

  void _restart() {
    setState(() {
      _totalScore = 0;
      _index = 0;
    });
  }

  Widget _getBody() {
    return _index < questions.length
        ? Quiz(question: questions[_index], onPressed: _answerQuestion)
        : Result(onResult: _restart, finalScore: _totalScore,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('QuizApp!'),
          ),
          body: _getBody()),
    );
  }
}
