import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicesWidget(),
      ),
    ),
  );
}

class DicesWidget extends StatefulWidget {
  @override
  _DicesWidgetState createState() => _DicesWidgetState();
}

class _DicesWidgetState extends State<DicesWidget> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 2;

  void changeDices () {
    rightDiceNumber = Random.secure().nextInt(6) + 1;
    leftDiceNumber = Random.secure().nextInt(6) + 1;
  }

  Expanded dice(int number) {
    return Expanded(
        child: FlatButton(
            onPressed: () {
              setState(() {
                changeDices();
              });
            },
            child: Image.asset('images/dice$number.png')
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            dice(leftDiceNumber),
            dice(rightDiceNumber)
          ],
        ),
      ),
    );
  }
}
