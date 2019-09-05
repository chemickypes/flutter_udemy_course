import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc/bloc.dart';

import 'dart:async';

enum AuthStatus { notSignedIn, signedIn }

enum AuthEvent { login, logout}

class AuthBloc extends Bloc<AuthEvent,AuthStatus> {

  @override
  AuthStatus get initialState {
    return AuthStatus.notSignedIn;
  }

  @override
  Stream<AuthStatus> mapEventToState(AuthEvent event) async* {

    switch (event) {
      case AuthEvent.login:
        yield AuthStatus.signedIn;
        break;
      case AuthEvent.logout:
        yield AuthStatus.notSignedIn;
        break;
    }
  }

}

abstract class BaseAuth {
  Future<String> loginWithEmailAndPassword(String email, String password);
  Future<String> registerWithEmailAndPassword(String email, String password, {String name});
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth extends BaseAuth {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> loginWithEmailAndPassword(String email, String password) async {
      var user = await _firebaseAuth.signInWithEmailAndPassword(email: email,password: password);
      return user.user.uid;
  }

  Future<String> registerWithEmailAndPassword(String email, String password, {String name}) async {
     var f = await _firebaseAuth.createUserWithEmailAndPassword(email: email,password: password).then(
        (auth) {
         auth.user.updateProfile(UserUpdateInfo()
          ..displayName = name)
          .then((value) {
            auth.user.sendEmailVerification();
          });
        }
      );

      return f;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

}