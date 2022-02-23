import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget{
  static const String idc = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(),
        ),
    );
  }

}