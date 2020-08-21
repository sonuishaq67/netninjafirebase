import 'package:brewcrew/models/usernew.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  //sign in email pass

  //anon sign in

  //sign out
}
