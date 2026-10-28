// In the original app, multiple buttons in the home screen, and the buttons in registration and login screen were redundant
// So as part of DRY refactoring (Part 1), the challenge was to bring the widget at one place then import
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String title;

  RoundedButton({this.color = Colors.white, required this.onPressed, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}