import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

// For this project, I'll have to look at the video then look at the docs because much has changed
// since the course was prepared and by now, 6 major versions have been released. I must improvise
// By following https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md
// I will now try to replicate the steps from the course

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioPlayer();
    player.setPlayerMode(PlayerMode.lowLatency);
    // This package seems to be a bit slow even with this, I don't know what I'm doing wrong
    // The documentation is insufficient perhaps
    player.play(AssetSource('note$num.wav'));
  }

  Expanded buildKey({required Color color, required int keyNum}){
    // I was surprised to see that this was (almost) the same way the course function was defined
    // only that since it was an older version of Dart, it didn't need the required modifier
    // but the course simply glossed over the fact that we're using Expanded as a data type
    // and Color as the argument data type

    // Of course the implementation of the function is a lot different from mine however
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(keyNum);
        },
        child: Container(
          color: color,
        ),
        style: ButtonStyle(
          padding:
          WidgetStatePropertyAll(EdgeInsetsGeometry.all(0.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          // First let's try to play a sound on buttonpress
          child: Center(
            child: Column(
              children: [
                // This was my initial approach for a single button
                // Expanded(
                //   child: TextButton(
                //       onPressed: () {
                //         final player = AudioPlayer();
                //         // This object can now be used to play a single sound at a time
                //         // For multiple sounds simultaneously, we need multiple instances
                //         player.play(AssetSource('note1.wav'));
                //       },
                //       child: Container(
                //         color: Colors.red,
                //       )),
                // ),

                // Since FlatButton was replaced with TextButton, a child is mandatory for button
                // Also the method of adding color to a button is as tedious as removing padding,
                // so I'll stick with my method
                buildKey(color: Colors.red, keyNum: 1),
                // All the Expanded widgets were here and to reduce repetitiveness we bundled it into a function
                buildKey(color: Colors.orange, keyNum: 2),
                buildKey(color: Colors.yellow, keyNum: 3),
                buildKey(color: Colors.green, keyNum: 4),
                buildKey(color: Colors.teal, keyNum: 5),
                buildKey(color: Colors.blue, keyNum: 6),
                buildKey(color: Colors.purple, keyNum: 7),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
