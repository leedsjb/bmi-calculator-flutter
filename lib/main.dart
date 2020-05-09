import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        // scaffoldBackgroundColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(
        //   body1: TextStyle(color: Colors.white), 
        // ),
      ),
      home: InputPage(),
    );
  }
}

// you can wrap a fab in Theme(data: ThemeData.themeName(),)
// you can set textTheme: TextTheme() property of the ThemeData object