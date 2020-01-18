import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.05,
          title: Text('Sign in to this App'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: RaisedButton(
              onPressed: () async {
                dynamic result =
                    await _auth.signInAnon(); // can be null or FireBaseUser
                if (result == null) {
                  print('Log in Fail');
                } else {
                  print('Sign in');
                  print(result);
                  print(result.uid);
                }
              },
              child: Text('Sign in anon'),
            )));
  }
}
