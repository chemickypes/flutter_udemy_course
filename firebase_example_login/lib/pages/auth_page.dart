import 'package:firebase_example_login/model/auth.dart';
import 'package:firebase_example_login/widgets/general_widgets.dart';
import 'package:firebase_example_login/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  AuthMode authoMode = AuthMode.Login;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: authoMode == AuthMode.Login ? _getLoginLayout() : _getSignupLayout(),
      ),
    );
  }

  Widget _getPasswordField(String label) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, filled: true),
      obscureText: true,
    );
  }

  Widget _getEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'E-Mail', filled: true),
      keyboardType: TextInputType.emailAddress,
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
             _getNameField('Surname'),
             SpacedBox25(),
             _getPasswordField('Password'),
             SpacedBox25(),
             _getPasswordField("Confirm Password"),
             SpacedBox25(),
             _getSwitchButton(),
              SpacedBox25(),
             MaterialButton(
               color: Colors.blue,
               textColor: Colors.white,
               child: Text('Login'),
               onPressed: () {},
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
        _getPasswordField("Password"),
        SpacedBox25(),
        _getSwitchButton(),
        SpacedBox25(),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login'),
          onPressed: () {},
        ),
      ],
    );
  }

  FlatButton _getSwitchButton() {
    return FlatButton(
      child: Text('Switch ${authoMode == AuthMode.Login ? 'Signup' : 'Login'}'),
      onPressed: () {

        setState(() {
         authoMode = authoMode == AuthMode.Login ? AuthMode.Signup : AuthMode.Login; 
        });
      },
    );
  }
}
