import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //final GestureTapCallback onPressed;
  final Function onPressed;
  final String text;

  const Answer({Key key, @required this.onPressed, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue[400],
        textColor: Colors.white,
        splashColor: Colors.blue[700],
        shape: StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Text(text),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
