import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sa_app/constants/constants.dart';
import 'package:sa_app/model/function.dart';
import 'package:sa_app/screens/login_screen.dart';
import 'package:sa_app/widgets/button.dart';
import 'package:sa_app/widgets/text.dart';

class WelcomePage extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _headerOfUser(),
              buildSizedBox(60.0),
              TextWidget(user!.displayName!),
              buildSizedBox(10.0),
              Text(user!.email!),
              buildSizedBox(10.0),
              TextWidget('Flutter Developer at Solution Analyst'),
              buildSizedBox(60.0),
              RoundButton(
                  'LOGOUT',
                  const Color(0xFF033d5b),
                  moveToNewScreen(context, LoginScreen())
              ),
            ],
          ),
        )
    );
}

  Widget _headerOfUser() => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(labelImage),
          fit: BoxFit.cover
      ),
    ),
    child: Container(
      width: double.infinity,
      height: 200,
      child: Container(
          alignment: const Alignment(0.0,2.5),
          child:CircleAvatar(
            backgroundColor: appBarColor,
            backgroundImage: NetworkImage(user!.photoURL!),
            radius: 60,
          )
      ),),
  );
  SizedBox buildSizedBox(height) => SizedBox(height: 20.0,);
}