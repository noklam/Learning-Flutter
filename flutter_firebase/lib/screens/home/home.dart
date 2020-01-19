import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/screens/home/brew_list.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brews,
        child: Scaffold(
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              title: Text('Deliverwolf'),
              backgroundColor: Colors.blue[400],
              elevation: 0.05,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  label: Text('Log out'),
                )
              ],
            ),
            body: BrewList()));
  }
}
