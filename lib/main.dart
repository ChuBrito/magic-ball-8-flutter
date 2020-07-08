import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Magic Ball 8'),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: MagicBall(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var messages = [
    'As I see it, yes.',
    'Ask again later.',
    'Better not tell you now.',
    'Cannot predict now.',
    'Concentrate and ask again.',
    'Don’t count on it.',
    'It is certain.',
    'It is decidedly so.'
  ];

  String currentMessage = 'Click Me';

  changeText() {
    setState(() {
      currentMessage = messages[Random().nextInt(messages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          changeText();
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset('images/magic_ball_bg.png'),
            Center(
              child: Container(
                width: 150,
                child: Text(
                  currentMessage,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
