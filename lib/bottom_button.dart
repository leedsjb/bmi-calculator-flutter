import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_constants.dart';

class BottomButton extends StatelessWidget{

  final String buttonText;
  final Function onTap;

    BottomButton({
      this.buttonText,
      this.onTap
    });

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
          child: Text(
            this.buttonText,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

