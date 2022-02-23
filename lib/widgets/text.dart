import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget{
  TextWidget(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 15.0,
        color:Colors.black45,
        letterSpacing: 2.0,
        fontWeight: FontWeight.w300,
        fontFamily: 'Roboto',
    ),
    );
  }

}