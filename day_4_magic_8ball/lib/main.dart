import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: BallPage()));

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Ask Me Anything',
                style: TextStyle(fontWeight: FontWeight.bold))),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Ball(),
      backgroundColor: Colors.blueAccent,
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int imageNum = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          setState(() {
            imageNum = Random().nextInt(5) + 1;
          });
        },
        child: Center(child: Image.asset('images/ball$imageNum.png')),
      ),
    );
  }
}
