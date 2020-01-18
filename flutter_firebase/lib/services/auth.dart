import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  handleError(e) {
    print(e.toString());
    return null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      handleError(e);
    }
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((_userFromFirebaseUser)); // Firebase built-in func
  }

  // final GoogleSignIn googleSignIn = GoogleSignIn();

  // sign in with email & password
  Future<User> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      return _userFromFirebaseUser(user);
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  // register with email & password
  Future<User> signUp(email, password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  // sign out
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      // await googleSignIn.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
