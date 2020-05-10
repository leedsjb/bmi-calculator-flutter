import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        // scaffoldBackgroundColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(
        //   body1: TextStyle(color: Colors.white), 
        // ),
      ),
    );
  }
}

// you can wrap a fab in Theme(data: ThemeData.themeName(),)
// you can set textTheme: TextTheme() property of the ThemeData object