import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var questionList = ['Question1', 'Question2', 'Question3'];

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
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
              Text(questionList.elementAt(questionIndex)),
              RaisedButton(child: Text('Answer 1'), onPressed: answerQuestion),
              RaisedButton(
                  child: Text('Answer 2'), onPressed: () => print('Answer 2')),
              RaisedButton(
                  child: Text('Answer 3'),
                  onPressed: () {
                    print('Answer3');
                  }),
            ],
          )),
    );
  }
}
