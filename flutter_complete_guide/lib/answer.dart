import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      child: RaisedButton(
          color: Colors.blue,
          child: Text('Answer1'),
          onPressed: () => print('Test Button')),
    );
  }
}
