import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_constants.dart';

class GenderCard extends StatelessWidget{

  final IconData icon;
  final String label;

  GenderCard({
    this.icon,
    this.label
  });

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$label',
          style: TextStyle(
            fontSize: kTextFontSize,
            color: kTextFontColor,
          )
        ),
      ]
    );
  }
}