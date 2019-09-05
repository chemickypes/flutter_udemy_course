import 'package:firebase_example_login/model/auth.dart';
import 'package:firebase_example_login/state/auth_objects.dart';
import 'package:firebase_example_login/widgets/general_widgets.dart';
//import 'package:firebase_example_login/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key, this.auth, this.onSignedIn}) : super(key: key);


  final VoidCallback onSignedIn;
  final BaseAuth auth;
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthMode authoMode = AuthMode.Login;
  final _formKey = GlobalKey<FormState>();


  String password;
  String email;
  String name;

  AuthBloc _authBlocProvider;

  @override
  Widget build(BuildContext context) {

    _authBlocProvider = BlocProvider.of<AuthBloc>(context);

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


  String _defaultPasswordValidator(String value){
    return value.isEmpty ? "Please enter a Password" : null;
  }

  Widget _getPasswordField(String label,  {Function(String) saveAction, Function(String) validatorFunction }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, filled: true),
      obscureText: true,
      validator: validatorFunction != null? validatorFunction : _defaultPasswordValidator,
      onSaved: saveAction!=null? saveAction: (value){},
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
      validator: (value){
        return value.isEmpty ? "Please enter a Name" : null;
      },
      onSaved: (value){
        name = value;
      },
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
        _getPasswordField('Password', saveAction: (value) {
          password = value;
        }),
        SpacedBox25(),
        _getPasswordField("Confirm Password", validatorFunction: (value) {
          //password = value;
          if(value != password){
            return "Passwords do not match";
          }else {
            return null;
          }
        }),
        SpacedBox25(),
        _getSwitchButton(),
        SpacedBox25(),
        MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Login'),
          onPressed: _validateAndRegister,
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
        _getPasswordField("Password", saveAction: (value) {
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

  void _validateAndSubmit() {
    if(_validateAndSave()){
      widget.auth.loginWithEmailAndPassword(email, password).then(
        (authId) {
          print('User: $authId');
          _authBlocProvider.dispatch(AuthEvent.login);
        }
      )
      .catchError((e) => print(e));
      
    }
  }

  void _validateAndRegister() {

     _formKey.currentState.save();
    if(_formKey.currentState.validate()){
     widget.auth.registerWithEmailAndPassword(email, password, name: name).then(
        (auth) {
         print('User is registered');
         _authBlocProvider.dispatch(AuthEvent.login);
        }
      );
    }
  }
}
