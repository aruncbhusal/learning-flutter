import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red[900],
//           foregroundColor: Colors.white,
//           title: Center(child: Text('I am Poor™️')),
//         ),
//         body: Center(child: Image(image: AssetImage('assets/images/poor.png'))),
//         backgroundColor: Colors.blueGrey[900],
//       ),
//     ),
//   );
// }

// This is fine, but I want to add something else so I asked GPT where I could read some more
// And I was pointed to these official docs from Flutter:
// https://docs.flutter.dev/ui
// Flutter takes inspiration from React and builds app based on Widgets with certain configuration and state
// In MaterialApp, the default text direction is left to right, else we have to specify ltr
// Each widget can be either Stateless or Stateful and it implements a build() function for widgets inside it
// The lowest level inside a widget is called a RenderObject
// Basic widgets: Text, Row, Column, Stack, Container
// I'll use Column in this app following docs: https://api.flutter.dev/flutter/widgets/Column-class.html

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          title: Center(child: Text('I am Poor™️')),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/poor.png'),
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please don\'t ask for money',
                      style: TextStyle(color: Colors.white54, fontSize: 20),
                    ),
                    Text(
                      'I have none.',
                      style: TextStyle(color: Colors.white60, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
    ),
  );
}
