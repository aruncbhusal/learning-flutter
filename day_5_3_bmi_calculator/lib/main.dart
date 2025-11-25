import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        // primaryColor: Color(0xAA090322),
        // I don't even know what this does, nothing changes when I comment it, and appBarTheme is separated from it
        scaffoldBackgroundColor: Color(0xAA090322),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xAA090322), foregroundColor: Colors.white),
        // floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.purple.shade900, foregroundColor: Colors.white),
        // textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        // Since we're copying the dark theme, text is white by default
      ),
    );
  }
}

