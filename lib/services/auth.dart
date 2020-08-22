import 'package:brewcrew/models/usernew.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserNew _userfirebase(User user) {
    return user != null ? UserNew(uid: user.uid) : null;
  }

  Stream<UserNew> get user {
    // return _auth.authStateChanges().map((User user) => _userfirebase(user));
    return _auth.authStateChanges().map(_userfirebase);
  }

  //sign in
  Future signInAnon() async {
    //
    try {
      var result = await _auth.signInAnonymously();
      User user = result.user;
      return _userfirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    //
    try {
      //
      return await _auth.signOut();
    } catch (e) {
      //

      print(e.toString());
      return null;
    }
  }

  //sign in email pass
  Future registerWithEmail(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //anon sign in
  Future signInWithEmail(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userfirebase(user);
    } catch (e) {
      print(e.toString());
    }
  }
  //sign out
}
