import 'package:flutter/material.dart';
import 'dart:math';

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

  void getWordCount() {
    setState(() {
      var rng = new Random();
      rng.nextInt(100);
    });
    print('Updating word count');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Words per minute'),
          ),
          body: Column(children: [
            Text('123'),
          ])),
    );
  }
}
