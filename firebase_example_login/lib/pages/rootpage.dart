import 'package:firebase_example_login/pages/auth_page.dart';
import 'package:firebase_example_login/pages/home_page.dart';
import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:flutter/material.dart';

enum AuthStatus { notSignedIn, signedIn }

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();

    widget.auth.currentUser().then((userID) {
      setState(() {
        _authStatus =
          userID == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
     _authStatus = AuthStatus.notSignedIn; 
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.notSignedIn:
        return AuthPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return HomePage(
          auth: widget.auth,
          onLogOut: _signedOut,
        );
    }

    return null;
  }
}
