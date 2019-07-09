import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  const FancyButton({Key key, @required this.onPressed, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        fillColor: Colors.deepPurple,
        splashColor: Colors.purple,
        onPressed: onPressed,
        shape: StadiumBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.explore, color: Colors.white),
              SizedBox(
                width: 8,
              ),
              Text(
                this.text,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
