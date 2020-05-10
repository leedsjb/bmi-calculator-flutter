import 'package:flutter/material.dart';

class CardButton extends StatelessWidget{

  CardButton(
    this.icon,
    this.onTapFunction,
  );

  final IconData icon;
  final Function onTapFunction;
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
          onPressed: onTapFunction,
        ),
      ),
    );
  }
}