import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/gender_card.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/bmi_constants.dart';

double _height = 192; // the initial height
double _weight = 125;
double _age = 25;

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
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: kTextFontSize,
                            color: kTextFontColor,
                          )
                        ),
                        Slider(
                          onChanged: (double newValue) {
                            setState( () => _height = newValue);
                          },
                          label: '$_height',
                          value: _height.toDouble(),
                          min: 20,
                          max: 200,
                          
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
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: kTextFontSize,
                            color: kTextFontColor,
                          ),
                        ),
                        Text(
                          '$_weight',
                        ),
                        Row(
                          children: <Widget>[
                            CardButton(FontAwesomeIcons.minus),
                            CardButton(FontAwesomeIcons.plus),
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
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: kTextFontSize,
                            color: kTextFontColor,
                          )
                        ),
                        Text(
                          '$_age',
                        ),
                        Row(
                          children: <Widget>[
                            CardButton(FontAwesomeIcons.minus),
                            CardButton(FontAwesomeIcons.plus),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
                      child: Text(
                'CALCULATE',
                style: TextStyle(),
              ),
            ),
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      )
    );
  }
}

class CardButton extends StatelessWidget{

  CardButton(
    this.icon,
    // this.param,
  );

  final IconData icon;
  // double param;

  @override
  Widget build(BuildContext context){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // borderRadius: BorderRadius.circular(13),
          color: Colors.grey,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0,3),
            ),
          ]
        ),
        child: FlatButton(
          child: Icon(
            this.icon,
            color: Colors.white,
          ),
          onPressed: null,
        ),
      ),
    );
  }
}