import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth}) ;

  final BaseAuth auth;

  AuthBloc _authBlocProvider;

  void _signOut() async {
    try {
      await auth.signOut().then((v) {
        _authBlocProvider?.dispatch(AuthEvent.logout);
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    _authBlocProvider = BlocProvider.of<AuthBloc>(context);
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
