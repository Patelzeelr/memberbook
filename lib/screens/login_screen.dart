import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/widgets/google_button.dart';

import '../constants/constants.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(appTitle),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image(image: AssetImage(labelImage)),
          GoogleButton(),
        ],
      ),
    );
  }
}