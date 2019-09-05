import 'package:firebase_example_login/model/user.dart';
import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:firebase_example_login/state/user_state.dart';
import 'package:firebase_example_login/widgets/user_widgtes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({this.auth});

  final BaseAuth auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBloc _authBlocProvider;

  void _signOut() async {
    try {
      await widget.auth.signOut().then((v) {
        _authBlocProvider?.dispatch(AuthEvent.logout);
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();

    widget.auth.currentUser().then((user){
      BlocProvider.of(context).dispatch(GetUserEvent()..user = user);
    });
    
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
      body: BlocProvider<UserBloc>(
        builder: (context) => UserBloc(),
        child: BlocBuilder<UserBloc, User>(
          builder: (context, user) {
            if (user.uid.isNotEmpty) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserWidget(
                    user: User('', "Angelo", 'angelo@bemind.me'),
                  ),
                ),
              );
            } else {
              return Container(
                child: Text(
                  "No User",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
