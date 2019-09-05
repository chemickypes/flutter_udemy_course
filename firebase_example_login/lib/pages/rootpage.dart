import 'package:firebase_example_login/pages/auth_page.dart';
import 'package:firebase_example_login/pages/home_page.dart';
import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  void initState() {
    super.initState();

    widget.auth.currentUser().then((userID) {
      if(userID != null){
        BlocProvider.of<AuthBloc>(context).dispatch(AuthEvent.login);
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      builder: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthStatus>(
        builder: (context, authStatus) {
          switch (authStatus) {
            case AuthStatus.notSignedIn:
              return AuthPage(
                auth: widget.auth,
              );
            case AuthStatus.signedIn:
              return HomePage(
                auth: widget.auth,
              );
              default: return null;
          }
        },
      ),
    );
  }
}
