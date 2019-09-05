import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.auth, this.onLogOut}) : super(key: key);

  final BaseAuth auth;
  final VoidCallback onLogOut;

  void _signOut() async {
    try {
      await auth.signOut().then((v) {
        onLogOut();
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.white,
              ),
            ),
            onPressed: _signOut,
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            'Welcome Mate',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
    );
  }
}
