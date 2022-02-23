import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/screens/add_employee.dart';
import 'package:sa_app/screens/employee_list.dart';
import 'package:sa_app/screens/user_profile.dart';
import 'package:sa_app/widgets/drawer.dart';

import '../constants/constants.dart';

class CustomNavigationBar extends StatefulWidget{

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _page = 0;


  final _pages = [
    AddEmployee(),
    EmployeeList(),
    WelcomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(appTitle),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      drawer: NavigateDrawer(),
      bottomNavigationBar: _animatedNavigationBar(),
      body: _pages[_page],
    );
  }

  Widget _animatedNavigationBar() => CurvedNavigationBar(
    items: const [
      Icon(Icons.add,size: 30.0,),
      Icon(Icons.list,size: 30.0,),
      Icon(Icons.account_circle,size: 30.0,),
    ],
    color: Colors.white,
    animationCurve: Curves.easeOutCirc,
    animationDuration: const Duration(milliseconds: 600),
    onTap: (index) {
      setState(() {
        _page = index;
      });
    },
  );
}