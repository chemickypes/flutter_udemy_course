import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

class ThirdAnimation extends StatefulWidget {
  final String title;
  ThirdAnimation({Key key, this.title}) : super(key: key);

  _ThirdAnimationState createState() => _ThirdAnimationState();
}

class _ThirdAnimationState extends State<ThirdAnimation> {
  bool showingFirstWidget = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            getAnimatedContainer(),
            getButton(context),
          ],
        ),
      ),
    );
  }

  RaisedButton getButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        setState(() {
          showingFirstWidget = !showingFirstWidget;
        });
      },
      child: Text('Change Stuff'),
    );
  }

  Widget getAnimatedContainer() {
    return AnimatedSwitcher(
      child: showingFirstWidget
          ? Image.asset('assets/psyduck.png')
          : FlutterLogo(
              size: MediaQuery.of(context).size.width,
            ),
      duration: Duration(seconds: 1),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
            child: ScaleTransition(
          scale: animation,
          child: child,
        ));
      },
    );
  }
}
