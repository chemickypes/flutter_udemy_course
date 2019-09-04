import 'package:firebase_example_login/model/auth.dart';
import 'package:firebase_example_login/widgets/general_widgets.dart';
import 'package:firebase_example_login/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthMode authoMode = AuthMode.Login;
  final _formKey = GlobalKey<FormState>();

  String password;
  String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login with Firebase"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: authoMode == AuthMode.Login
                  ? _getLoginLayout()
                  : _getSignupLayout(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getPasswordField(String label, Function saveAction) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, filled: true),
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) return 'Please enter a Password';
        return null;
      },
      onSaved: saveAction,
    );
  }

  Widget _getEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'E-Mail', filled: true),
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        return value.isEmpty ? "Please enter an email" : null;
      },
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget _getNameField(String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, filled: true),
      keyboardType: TextInputType.text,
    );
  }

  Widget _getSignupLayout() {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getEmailField(),
        SpacedBox25(),
        _getNameField('Name'),
        SpacedBox25(),
        _getPasswordField('Password', (value) {
          password = value;
        }),
        SpacedBox25(),
        _getPasswordField("Confirm Password", (value) {
          //password = value;
        }),
        SpacedBox25(),
        _getSwitchButton(),
        SpacedBox25(),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login'),
          onPressed: _validateAndSubmit,
        ),
      ],
    );
  }

  Widget _getLoginLayout() {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getEmailField(),
        SpacedBox25(),
        _getPasswordField("Password", (value) {
          password = value;
        }),
        SpacedBox25(),
        _getSwitchButton(),
        SpacedBox25(),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login'),
          onPressed: _validateAndSubmit,
        ),
      ],
    );
  }

  FlatButton _getSwitchButton() {
    return FlatButton(
      child: Text('Switch ${authoMode == AuthMode.Login ? 'Signup' : 'Login'}'),
      onPressed: () {
        setState(() {
          authoMode =
              authoMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
        });
      },
    );
  }

  bool _validateAndSave() {
    if (_formKey.currentState.validate()) {
     _formKey.currentState.save();
     print('Email: $email; Password: $password');
     return true;
    }else {
      return false;
    }
  }

  void _validateAndSubmit(){
    if(_validateAndSave()){

    }
  }
}
