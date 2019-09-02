import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double containerSize = 300;
  double containerTranslationY = 0;

  void _incrementCounter() {
    setState(() {
      containerSize = 200 + math.Random().nextInt(100).toDouble();
      containerTranslationY = 200 + math.Random().nextInt(100).toDouble();
    });
  }

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
        _incrementCounter();
      },
      child: Text('Chanhe Stuff'),
    );
  }

  Widget getAnimatedContainer() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.easeInOutCubic,
      width: containerSize,
      height: containerSize,
      transform: Matrix4.translation(vector.Vector3(0, containerTranslationY, 0)),
      padding: EdgeInsets.all(30),
      child: Image.asset('assets/psyduck.png'),
    );
  }
}
