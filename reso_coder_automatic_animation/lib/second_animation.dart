import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

class SecondHomePage extends StatefulWidget {
  SecondHomePage({Key key, this.title}) : super(key: key);

  final String title;

  _SecondHomePageState createState() => _SecondHomePageState();
}

class _SecondHomePageState extends State<SecondHomePage> {
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
      child: Text('Chanhe Stuff'),
    );
  }

  Widget getAnimatedContainer() {
    return AnimatedCrossFade(
      firstChild: Image.asset('assets/psyduck.png'),
      secondChild: FlutterLogo(
        size: MediaQuery.of(context).size.width / 1.5,
      ),
      duration: Duration(seconds: 1),
      sizeCurve: Curves.easeInCubic,
      crossFadeState: showingFirstWidget
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
