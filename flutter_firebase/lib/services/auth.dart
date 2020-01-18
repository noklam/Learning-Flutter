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
  Future<FirebaseUser> signIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  // register with email & password
  Future<FirebaseUser> signUp(email, password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

  // sign out
  Future<bool> googleSignout() async {
    await _auth.signOut();
    // await googleSignIn.signOut();
    return true;
  }
}
