import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {

  final Map<String, Object> question;
  final Function onPressed;
  const Quiz({Key key, @required this.question, @required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: <Widget>[
              QuestionWidget(
                questionText: question['questionText'],
              ),
              ...(question['answers'] as List<Map<String,Object>>).map((answer) {
                return Answer(
                  text: answer['text'] as String,
                  onPressed: () => onPressed(answer['score']),
                );
              }).toList()
            ],
          ),
    );
  }
}