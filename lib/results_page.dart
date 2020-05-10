
import 'package:flutter/material.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/bmi_constants.dart';

class ResultsPage extends StatelessWidget{

  static const String resultMessageLow = 'You have a lower than normal BMI.';
  static const String resultMessageBormal = 'You have a normal BMI.';
  static const String resultMessageHigh = 'You have a higher than normal BMI.';

  final String displayMessage;

  ResultsPage({
    this.displayMessage,
  });
  

  @override
  Widget build(BuildContext context){

    final int _bmiResult = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 1,
            // child: Container(
              child: Text(
                'Your Results',
                style: kH1,
              ),
            // ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'OVERWEIGHT',
                    style: kSubtitleText,
                  ),
                  Text(
                    _bmiResult.toString(),
                    style: kBigText,
                  ),
                  Text(
                    resultMessageHigh,
                    style: kBodyText,
                  )
                ],
              ),
            ),
            ),
      
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          ),
        ],
      )
    );
  }

}