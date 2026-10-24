import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Color.from(alpha: 0.8, red: 0, green: 0, blue: 0.1),
          appBarTheme: AppBarThemeData(backgroundColor: Color.from(alpha: 0.7, red: 0, green: 0, blue: 0.1))),
      home: PriceScreen(),
    );
  }
}
