import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextfield extends StatelessWidget{
  CustomTextfield(this.input,this.hint,this.controller,this.onChange,this.fNode,this.nNode);

  final TextInputType input;
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChange;
  final FocusNode fNode;
  final FocusNode nNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: fNode,
      textInputAction: TextInputAction.next,
      controller: controller,
      onChanged: onChange,
      keyboardType: input,
      textAlign: TextAlign.center,
      decoration: kTextFieldInputDecoration.copyWith(hintText: hint),
      onSubmitted: (term) {
        fNode.unfocus();
        FocusScope.of(context).requestFocus(nNode);
      },
    );
  }

}