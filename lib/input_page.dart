import 'package:flutter/material.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/gender_card.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/card_button.dart';
import 'package:bmi_calculator/bmi_constants.dart';

int _height = 192; // the initial height
int _weight = 125;
int _age = 25;
int _bmi;

enum Gender{male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  //  void incrementCounter(){
  //   setState((){
  //     this.param++;
  //   })
  // }

  Gender _selectedGender; // starts out as null, uses enum

  // replaced w/ Turnary Operator logic
  // Color _maleCardColor = inactiveCardColor;
  // Color _femaleCardColor = inactiveCardColor;

  // void updateColor(Gender cardGender){
  //   if(cardGender == Gender.female){ // female card
  //       setState((){
  //         _femaleCardColor = activeCardColor;
  //         _maleCardColor = inactiveCardColor;
  //       });
  //   } else if(cardGender == Gender.male){ // male card
  //       setState((){
  //         _maleCardColor = activeCardColor;
  //         _femaleCardColor = inactiveCardColor;
  //       });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTapFunction: () => setState(() => _selectedGender = Gender.female),
                    color: _selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE'
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard( 
                    onTapFunction: () => setState( () => _selectedGender = Gender.male),
                    color: _selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: kTextFontSize,
                            color: kTextFontColor,
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              _height.toString(),
                              style: kBigText,
                            ),
                            Text(
                              'cm',
                              style: kBodyText
                            )
                          ],
                        ),
                        Slider(
                          onChanged: (double newValue) {
                            setState( () => _height = newValue.toInt());
                          },
                          label: '$_height',
                          value: _height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kSubtitleText,
                        ),
                        Text(
                          _weight.toString(),
                          style: kBigText,
                        ),
                        Row(
                          children: <Widget>[
                            CardButton(
                              FontAwesomeIcons.minus,
                              ()=> setState( () => _weight-- )
                            ),
                            CardButton(
                              FontAwesomeIcons.plus,
                              ()=> setState( () => _weight++)
                              ),
                          ],
                        )
                      ],
                    )
                      ,),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kSubtitleText,
                        ),
                        Text(
                          '$_age',
                          style: kBigText,
                        ),
                        Row(
                          children: <Widget>[
                            CardButton(
                              FontAwesomeIcons.minus,
                              ()=> setState( () => _age--)
                            ),
                            CardButton(
                              FontAwesomeIcons.plus,
                              ()=> setState( () => _age++)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap:  () {
              _bmi = calculateBMI();
              print(_bmi.toString());
              Navigator.pushNamed(
                context,
                '/results',
                arguments: _bmi,
              );
            },
          ),
        ],
      )
    );
  }
}

int calculateBMI(){

  int _calculatedBMI = _weight ~/ ((_height*_height)/(100*100));
  print('the calculated BMI is: $_calculatedBMI');
  return _calculatedBMI;
}