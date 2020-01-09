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

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('no more questions!');
    }
    print(_questionIndex);
  }

  var _questions = [
    {
      'questionText': 'Question1',
      'answer': ['Answer', 'Answer', 'Answer']
    },
    {
      'questionText': 'Question2',
      'answer': ['Answer', 'Answer', 'Answer']
    },
    {
      'questionText': 'Question3',
      'answer': ['Answer', 'Answer', 'Answer']
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hi Nok'),
        ),
        body: _questionIndex < _questions.length
            ? Column(
                children: [
                  Question(
                    _questions[_questionIndex]['questionText'],
                  ),
                  ...(_questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it! 🤣🤣'),
              ),
      ),
    );
  }
}
