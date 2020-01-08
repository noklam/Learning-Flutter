import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _questions = [
    'This is Question 1',
    'Yet another Question 2',
    'Final Question3'
  ];

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('This is my answer, hehe');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Hi Nok'),
          ),
          body: Column(
            children: [
              Question(_questions.elementAt(_questionIndex)),
              RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion),
              Answer(),
              Answer(),
            ],
          )),
    );
  }
}
