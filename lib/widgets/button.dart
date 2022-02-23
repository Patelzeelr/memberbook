import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton(this.label,this.color,this.onPressed);

  final String label;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: size.width * 0.8,
          height: 42.0,
          child: Text(
            label,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}