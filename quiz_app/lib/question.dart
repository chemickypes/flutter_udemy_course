
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {


  final String questionText;
  const QuestionWidget({Key key, @required this.questionText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(questionText),
    );
  }
}