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
  var count = 0;
  var tooFast = 50;

  void getWordCount() {
    setState(() {
      var rng = new Random();
      count = rng.nextInt(100);
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
            Text(count.toString()),
            Card(
                child: Column(
                  children: [
                    Text(count.toString(),
                        style: TextStyle(
                          fontSize: 48.0,
                        )),
                  ],
                ),
                color: count > tooFast ? Colors.redAccent : Colors.green),
            RaisedButton(child: Text('Debug Botton'), onPressed: getWordCount),
          ])),
    );
  }
}
