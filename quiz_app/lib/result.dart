import 'package:flutter/material.dart';
import 'fancy_button.dart';

class Result extends StatelessWidget {
  final Function onResult;
  final int finalScore;
  const Result({Key key, @required this.finalScore, @required this.onResult}) : super(key: key);
  
  
  String get resultPhrase{
    return "Ok! You got $finalScore!!";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                width: double.infinity,
                child: Text(
                  resultPhrase,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              FancyButton(
                text: 'Restart',
                onPressed: onResult,
              )
            ],
          ),
    );
  }
}