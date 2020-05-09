import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget{

  // const ReusableCard({
  //   Key key,
  // }) : super(key: key);

  ReusableCard({
    @required this.color,
    this.cardChild,
    this.onTapFunction,
  });
  
  final Color color; 
  final Widget cardChild;
  final Function onTapFunction;
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: this.onTapFunction,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}