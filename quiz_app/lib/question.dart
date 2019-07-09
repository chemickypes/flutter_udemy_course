import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  const QuestionWidget({Key key, @required this.questionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
